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

  static DeliveryType fromLabel(String label) {
    return DeliveryType.values.firstWhere((e) => e.label == label);
  }
}