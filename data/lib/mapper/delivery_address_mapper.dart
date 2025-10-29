import 'package:data/modules/delivery_address/models/local/delivery_address_box.dart';
import 'package:domain/modules/user_information/models/index.dart';

extension DeliveryAddressToBoxMapper on DeliveryAddressEntity {
  DeliveryAddressBox get toBox {
    return DeliveryAddressBox(
      deliveryType: deliveryType,
      pickupLocation: pickupLocation,
      country: country,
      city: city,
      comments: comments,
      region: region,
      postalCode: postalCode,
      address: address,
    );
  }
}

extension DeliveryAddressToEntityMapper on DeliveryAddressBox {
  DeliveryAddressEntity get toEntity {
    return DeliveryAddressEntity(
      deliveryType: deliveryType,
      comments: comments,
      pickupLocation: pickupLocation,
      country: country,
      region: region,
      city: city,
      postalCode: postalCode,
      address: address,
    );
  }
}
