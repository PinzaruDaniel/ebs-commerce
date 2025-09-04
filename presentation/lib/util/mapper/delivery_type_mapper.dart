import 'package:flutter/cupertino.dart';
import '../enum/delivery_type.dart';

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
