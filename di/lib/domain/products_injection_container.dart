import 'package:domain/modules/products/products_repository.dart';
import 'package:domain/modules/products/use_cases/clear_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_count_use_case.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_orders_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_by_marks_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_response_use_case.dart';
import 'package:domain/modules/products/use_cases/set_orders_use_case.dart';
import 'package:domain/modules/products/use_cases/stream_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:domain/modules/products/use_cases/sync_products_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;

  dataDi.registerLazySingleton<GetFilteredProductsUseCase>(
    () => GetFilteredProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<GetFilteredProductsCountUseCase>(
    () => GetFilteredProductsCountUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<StreamProductsUseCase>(
    () => StreamProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<GetNewProductsUseCase>(
    () => GetNewProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<GetSaleProductsUseCase>(
    () => GetSaleProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<SyncProductsUseCase>(
    () => SyncProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );

  dataDi.registerLazySingleton<SetOrdersUseCase>(
    () => SetOrdersUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<GetProductsResponseUseCase>(
    () => GetProductsResponseUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<ClearProductsUseCase>(
    () => ClearProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
  dataDi.registerLazySingleton<GetProductsByMarksUseCase>(
    () => GetProductsByMarksUseCase(productsRepository: dataDi<ProductsRepository>()),
  );
}
