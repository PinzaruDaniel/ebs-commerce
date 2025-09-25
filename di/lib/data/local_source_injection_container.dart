import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/products/sources/local/products_local_source.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  final store = await ObjectBoxStore.create();

  dataDi.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(productBox: store.productBox),
  );

  //TODO: lazysingleton to init localsources
}
