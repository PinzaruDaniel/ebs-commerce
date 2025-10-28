import 'package:data/modules/products/models/local/product_box.dart';
import 'package:data/modules/user_information/models/local/delivery_address/delivery_address_box.dart';
import 'package:data/modules/user_information/models/local/payment_method/payment_method_box.dart';
import 'package:data/modules/user_information/models/local/user/user_box.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../modules/categories/models/local/category_box.dart';
import '../modules/specifications/models/local/specification_box.dart';
import '../objectbox.g.dart';

class ObjectBoxStore {
  late final Store _store;
  late final Box<ProductBox> productBox;
  late final Box<CategoryBox> categoryBox;
  late final Box<SpecificationBox> specificationBox;
  late final Box<UserBox> userBox;
  late final Box<PaymentMethodBox> paymentMethodBox;
  late final Box<DeliveryAddressBox> deliveryAddressBox;
  ObjectBoxStore._create(this._store){
    productBox=Box<ProductBox>(_store);
    categoryBox=Box<CategoryBox>(_store);
    specificationBox=Box<SpecificationBox>(_store);
    userBox=Box<UserBox>(_store);
    paymentMethodBox=Box<PaymentMethodBox>(_store);
    deliveryAddressBox=Box<DeliveryAddressBox>(_store);
  }
  static Future<ObjectBoxStore> create() async {
    final store = await openStore(
        directory:
        p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"),
        macosApplicationGroup: "objectbox.demo");
    return ObjectBoxStore._create(store);
  }
}
