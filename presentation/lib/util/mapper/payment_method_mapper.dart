import 'package:domain/modules/user_information/models/index.dart';
import 'package:presentation/view/payment_method_view_model.dart';

extension PaymentMethodToEntity on PaymentMethodViewModel {
  PaymentMethodEntity get toEntity {
    return PaymentMethodEntity(key: key, titleKey: titleKey);
  }
}

extension PaymentMethodToViewModelMapper on PaymentMethodEntity {
  PaymentMethodViewModel get toModel {
    return PaymentMethodViewModel(key: key, titleKey: titleKey);
  }
}
