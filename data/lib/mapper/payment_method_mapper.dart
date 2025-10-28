import 'package:data/modules/user_information/models/local/payment_method/payment_method_box.dart';
import 'package:domain/modules/user_information/models/index.dart';

extension PaymentMethodToBoxMapper on PaymentMethodEntity{
  PaymentMethodBox get toBox{
    return PaymentMethodBox(id: id, key: key, titleKey: titleKey);
  }
}
extension PaymentMethodToEntityMapper on PaymentMethodBox {
  PaymentMethodEntity get toEntity{
    return PaymentMethodEntity(id: id, key: key, titleKey: titleKey);
  }
}