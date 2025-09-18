import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/products/models/local/product_box.dart';
import 'package:objectbox/objectbox.dart';

import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/delivery_address/delivery_address_repository_impl.dart';
import 'package:data/modules/delivery_address/sources/remote/delivery_address_api_service.dart';
import 'package:data/modules/products/products_repository_impl.dart';
import 'package:data/modules/categories/categories_repository_impl.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:domain/modules/delivery_address/delivery_address_repository.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:domain/modules/categories/categories_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  final store = await ObjectBoxStore.getStore();

  dataDi.registerLazySingleton<Box<ProductBox>>(() => store.box<ProductBox>());

  dataDi.registerLazySingleton<ProductsRepository>(
        () => ProductsRepositoryImpl(
      apiService: dataDi<ProductsApiService>(),
      productBox: dataDi<Box<ProductBox>>(),
    ),
  );

  dataDi.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(apiService: dataDi<CategoriesApiService>()),
  );
  dataDi.registerLazySingleton<DeliveryAddressRepository>(
    () => DeliveryAddressRepositoryImpl(
      apiService: dataDi<DeliveryAddressApiService>(),
    ),
  );
}
