import 'package:data/modules/payment_method/models/local/payment_method_box.dart';
import 'package:domain/modules/payment_method/index.dart';

extension PaymentMethodToBoxMapper on PaymentMethodEntity {
  PaymentMethodBox get toBox {
    return PaymentMethodBox(key: key, titleKey: titleKey);
  }
}

extension PaymentMethodToEntityMapper on PaymentMethodBox {
  PaymentMethodEntity get toEntity {
    return PaymentMethodEntity(key: key, titleKey: titleKey);
  }
}
