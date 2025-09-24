import 'package:flutter/cupertino.dart';
import 'package:presentation/util/resources/app_icons.dart';
import '../../view/cart_products_view_model.dart';
import '../resources/app_texts.dart';
import 'enums.dart';

extension DeliveryTypeMapper on DeliveryType {
  String get label {
    switch (this) {
      case DeliveryType.pickup:
        return AppTexts.ridicareLaSediu;
      case DeliveryType.fanCourier:
        return AppTexts.fanCourier;
      case DeliveryType.dhl:
        return AppTexts.dhl;
    }
  }
  static DeliveryType fromLabel(String label) {
    return DeliveryType.values.firstWhere((e) => e.label == label);
  }

  Image? get image {
    switch (this) {
      case DeliveryType.pickup:
        return null;
      case DeliveryType.fanCourier:
        return AppIcons.fanCourier;
      case DeliveryType.dhl:
        return AppIcons.dhl;
    }
  }
}
extension CartViewModelExtension on CartViewModel {
  double get unitPrice {
    final priceString = discountedPrice ?? price;
    return double.tryParse(priceString ?? '') ?? 0.0;
  }
  double get totalPrice {
    final total = unitPrice * quantity;
    return double.tryParse(total.toStringAsFixed(2)) ?? 0.0;
  }
}


extension MapTextProductType on ProductListType {
  String? get title {
    switch (this) {
      case ProductListType.newProducts:
        return AppTexts.newProducts;
      case ProductListType.saleProducts:
        return AppTexts.saleProducts;
      case ProductListType.allProducts:
        return AppTexts.allProducts;
      default:
        return null;
    }
  }
}

extension PaymentMethodExtension on PaymentMethod {
  String get title {
    switch (this) {
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.cash:
        return AppTexts.cashPaymentMethod;
    }
  }
}
