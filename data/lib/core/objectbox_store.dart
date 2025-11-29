import 'package:data/modules/auth/models/local/auth_token_box.dart';
import 'package:data/modules/products/models/local/order_box.dart';
import 'package:data/modules/products/models/local/ordered_product_box.dart';
import 'package:data/modules/products/models/local/product_box.dart';
import 'package:data/modules/delivery_address/models/local/delivery_address_box.dart';
import 'package:data/modules/payment_method/models/local/payment_method_box.dart';
import 'package:data/modules/settings/models/local/settings_box.dart';
import 'package:data/modules/user/models/local/user_box.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../modules/categories/models/local/category_box.dart';
import '../modules/specifications/models/local/specification_box.dart';
import '../objectbox.g.dart';

class ObjectBoxStore {
  late final Store _store;
  late final Box<AuthTokenBox> authTokenBox;
  late final Box<ProductBox> productBox;
  late final Box<CategoryBox> categoryBox;
  late final Box<SpecificationBox> specificationBox;
  late final Box<UserBox> userBox;
  late final Box<PaymentMethodBox> paymentMethodBox;
  late final Box<DeliveryAddressBox> deliveryAddressBox;
  late final Box<SettingsBox> settingsBox;
  late final Box<OrderedProductBox> orderedProductBox;
  late final Box<OrderBox> orderBox;

  ObjectBoxStore._create(this._store) {
    orderedProductBox=Box<OrderedProductBox>(_store);
    orderBox=Box<OrderBox>(_store);
    authTokenBox = Box<AuthTokenBox>(_store);
    productBox = Box<ProductBox>(_store);
    categoryBox = Box<CategoryBox>(_store);
    specificationBox = Box<SpecificationBox>(_store);
    userBox = Box<UserBox>(_store);
    paymentMethodBox = Box<PaymentMethodBox>(_store);
    deliveryAddressBox = Box<DeliveryAddressBox>(_store);
    settingsBox = Box<SettingsBox>(_store);


  }

  static Future<ObjectBoxStore> create() async {
    final store = await openStore(
      directory: p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"),
      macosApplicationGroup: "objectbox.demo",
    );
    return ObjectBoxStore._create(store);
  }
}
