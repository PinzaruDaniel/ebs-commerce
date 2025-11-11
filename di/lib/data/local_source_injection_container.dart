import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/products/sources/local/products_local_source.dart';
import 'package:data/modules/settings/sources/local/settings_local_source.dart';
import 'package:data/modules/user/sources/local/user_local_source.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  final store = await ObjectBoxStore.create();

  dataDi.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(
      productBox: store.productBox,
      specBox: store.specificationBox,
      categoryBox: store.categoryBox,
      orderBox: store.orderBox
    ),
  );

  dataDi.registerLazySingleton<UserLocalSource>(
    () => UserLocalDataSourceImpl(
      userBox: store.userBox,
      paymentMethodBox: store.paymentMethodBox,
      deliveryAddressBox: store.deliveryAddressBox,
    ),
  );
 dataDi.registerLazySingleton<SettingsLocalSource>(() => SettingsLocalSourceImpl(settingsBox: store.settingsBox));

  dataDi.registerLazySingleton<AuthLocalSource>(() => AuthLocalSourceImpl(authTokenBox: store.authTokenBox));
}
