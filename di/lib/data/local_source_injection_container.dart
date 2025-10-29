import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/delivery_address/sources/local/delivery_address_local_source.dart';
import 'package:data/modules/payment_method/sources/local/payment_method_local_source.dart';
import 'package:data/modules/products/sources/local/products_local_source.dart';
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
    ),
  );

  dataDi.registerLazySingleton<UserLocalSource>(() => UserLocalDataSourceImpl(userBox: store.userBox));

  dataDi.registerLazySingleton<PaymentMethodLocalSource>(
    () => PaymentMethodLocalDataSourceImpl(paymentMethodBox: store.paymentMethodBox),
  );

  dataDi.registerLazySingleton<DeliveryAddressLocalSource>(()
  =>DeliveryAddressLocalDataSourceImpl(deliveryAddressBox: store.deliveryAddressBox));
}
