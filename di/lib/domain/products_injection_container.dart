import 'package:domain/modules/products/products_repository.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_count_use_case.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;

  dataDi.registerLazySingleton<GetFilteredProductsUseCase>(
    () => GetFilteredProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<GetFilteredProductsCountUseCase>(
    () => GetFilteredProductsCountUseCase(productsRepository: dataDi<ProductsRepository>()),
  );

  /*dataDi.registerLazySingleton<GetSaleProductsUseCase>(
    () => GetSaleProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );

  dataDi.registerLazySingleton<GetNewProductsUseCase>(
    () => GetNewProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );*/

  dataDi.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );


}
