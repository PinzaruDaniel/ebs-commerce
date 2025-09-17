import 'package:flutter/cupertino.dart';
import '../resources/app_texts.dart';
import 'enums.dart';

extension DeliveryTypeMapper on DeliveryType {
  String get label {
    switch (this) {
      case DeliveryType.pickup:
        return 'Ridicare la sediu';
      case DeliveryType.fanCourier:
        return 'Fan courier';
      case DeliveryType.dhl:
        return 'DHL';
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
        return Image.asset('assets/icons/fan_courier.png');
      case DeliveryType.dhl:
        return Image.asset('assets/icons/dhl.png');
    }
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