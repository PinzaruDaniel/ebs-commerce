import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/products/sources/local/products_local_source.dart';
import 'package:data/modules/user_information/sources/local/payment_method/payment_method_local_source.dart';
import 'package:data/modules/user_information/sources/local/user/user_local_source.dart';
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
}
