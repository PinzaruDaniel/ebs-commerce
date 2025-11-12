import 'package:common/constants/logger.dart';
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
    //TODO: to move this in another place
    var usaCountry = country!.contains('USA') ? 'United States' : country;
    var usaRegion= region!.contains('IL')? 'Illinois':region;
    return DeliveryAddressViewModel(
      deliveryType: deliveryType,
      comments: comments,
      pickupLocation: pickupLocation,
      country: usaCountry,
      region: usaRegion,
      city: city,
      postalCode: postalCode,
      address: address,
    );
  }
}
