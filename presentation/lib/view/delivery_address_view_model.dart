import 'package:presentation/view/base_view_model.dart';

class DeliveryAddressViewModel extends BaseViewModel {
  final String deliveryType;
  final String? pickupLocation;
  final String? country;
  final String? region;
  final String? city;
  final String? postalCode;
  final String? address;
  final String? comments;

  DeliveryAddressViewModel({
    required this.deliveryType,
    this.pickupLocation,
    this.country,
    this.region,
    this.city,
    this.postalCode,
    this.address,
    this.comments,
  });
}
