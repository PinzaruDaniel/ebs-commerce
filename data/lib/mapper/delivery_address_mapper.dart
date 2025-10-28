import 'package:data/modules/user_information/models/local/delivery_address/delivery_address_box.dart';
import 'package:domain/modules/user_information/models/index.dart';

extension DeliveryAddressToBoxMapper on DeliveryAddressEntity {
  DeliveryAddressBox get toBox {
    return DeliveryAddressBox(
      id: id,
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
      id: id,
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
