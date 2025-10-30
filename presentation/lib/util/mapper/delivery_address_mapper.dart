import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:presentation/view/delivery_address_view_model.dart';

extension DeliveryAddressToEntity on DeliveryAddressViewModel {
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

extension DeliveryAddressToModelMapper on DeliveryAddressEntity {
  DeliveryAddressViewModel get toModel {
    return DeliveryAddressViewModel(
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
