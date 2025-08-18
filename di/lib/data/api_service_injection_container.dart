import 'package:common/constants/api_constants.dart';
import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/delivery_address/sources/remote/delivery_address_api_service.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
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
    validateStatus: (status) {
      return status! < 400 || status == 301 || status == 302; // Accept 301 and 302 redirects
    },
  );

  var mainClient = Dio(apiClientOption);

  var addressesClient = Dio(apiAddressesOption);
  addressesClient.interceptors.add(
    LogInterceptor(requestBody: true, responseBody: true),
  );

  mainClient.interceptors.add(
    LogInterceptor(requestBody: true, responseBody: true),
  );

  GetIt.instance.registerLazySingleton<ProductsApiService>(
    () => ProductsApiService(mainClient),
  );

  GetIt.instance.registerLazySingleton<CategoriesApiService>(
    () => CategoriesApiService(mainClient),
  );

  GetIt.instance.registerLazySingleton<DeliveryAddressApiService>(
    () => DeliveryAddressApiService(addressesClient),
  );
}
