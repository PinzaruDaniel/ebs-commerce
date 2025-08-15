import 'package:common/constants/api_constants.dart';
import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/cities/sources/remote/cities_api_service.dart';
import 'package:data/modules/countries/sources/remote/countries_api_service.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:data/modules/states/sources/remote/states_api_service.dart';
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
    baseUrl: 'https://countriesnow.space/api/v0.1/countries',
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );

  var mainClient = Dio(apiClientOption);

  var addressesClient=Dio(apiAddressesOption);
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



  //Addresses
  GetIt.instance.registerLazySingleton<CountriesApiService>(
      ()=>CountriesApiService(addressesClient),
  );

  GetIt.instance.registerLazySingleton<StatesApiService>(
      ()=>StatesApiService(addressesClient),
  );

  GetIt.instance.registerLazySingleton<CitiesApiService>(
        ()=>CitiesApiService(addressesClient),
  );


}
