import 'package:presentation/util/enum/enums.dart';
import 'package:presentation/view/base_view_model.dart';

class DeliveryAddressViewModel extends BaseViewModel {
  final DeliveryType deliveryType;
  final String? comments;


  //TODO: to remove it
  final String? pickupLocation;

  //TODO: separate in one model
  final String? country;
  final String? region;
  final String? city;
  final String? postalCode;
  final String? address;

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
