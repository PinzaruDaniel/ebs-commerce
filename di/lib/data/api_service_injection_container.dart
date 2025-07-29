
import 'package:common/constants/api_constants.dart';
import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var apiClientOption = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: ApiConstants.saasAppToken,
    receiveTimeout: Duration(seconds: 10),
    connectTimeout: Duration(seconds: 8),

  );

  var mainClient = Dio(apiClientOption);

  mainClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  GetIt.instance.registerLazySingleton<ProductsApiService>(() => ProductsApiService(mainClient));
  GetIt.instance.registerLazySingleton<CategoriesApiService>(()=> CategoriesApiService(mainClient));
}
