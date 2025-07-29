import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/products/products_repository_impl.dart';
import 'package:data/modules/categories/categories_repository_impl.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:domain/modules/categories/categories_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;

  dataDi.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(apiService: dataDi<ProductsApiService>()),
  );

  dataDi.registerLazySingleton<CategoriesRepository>(
      ()=>CategoriesRepositoryImpl(apiService: dataDi<CategoriesApiService>()),
  );
}
