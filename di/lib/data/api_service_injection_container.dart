import 'package:common/constants/api_constants.dart';
import 'package:data/core/auth_interceptor.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/delivery_address/sources/remote/delivery_address_api_service.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:data/modules/user/sources/remote/current_user_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var apiClientOption = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: ApiConstants.saasAppToken,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );
  var apiAddressesOption = BaseOptions(
    baseUrl: ApiConstants.deliveryUrl,
    followRedirects: true,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );
  var authOption = BaseOptions(
    baseUrl: ApiConstants.authUrl,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );
  var tokenOption = BaseOptions(
    baseUrl: ApiConstants.authUrl,
    responseType: ResponseType.json,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );

  //MAIN CLIENT//////
  var mainClient = Dio(apiClientOption);
  mainClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  //////////ADDRESS CLIENT///////////
  var addressesClient = Dio(apiAddressesOption);
  addressesClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  //////TOKEN CLIENT//////
  var tokenClient = Dio(tokenOption);
  tokenClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  GetIt.instance.registerLazySingleton<AuthApiService>(() => AuthApiService(tokenClient));

  ///AUTH CLIENT///////////
  var authClient = Dio(authOption);
  var refreshInterceptor = RefreshInterceptor(
    authApiService: GetIt.instance<AuthApiService>(),
    authLocalSource: GetIt.instance<AuthLocalSource>(),
  );
  authClient.interceptors.add(AuthInterceptor(dio: tokenClient, refreshInterceptor: refreshInterceptor));

  ///////////REGISTERING SERVICES///////
  GetIt.instance.registerLazySingleton<CurrentUserApiService>(() => CurrentUserApiService(authClient));

  //TODO: add authClient only for services that request headers

  GetIt.instance.registerLazySingleton<ProductsApiService>(() => ProductsApiService(mainClient));

  GetIt.instance.registerLazySingleton<CategoriesApiService>(() => CategoriesApiService(mainClient));

  GetIt.instance.registerLazySingleton<DeliveryAddressApiService>(() => DeliveryAddressApiService(addressesClient));
}
