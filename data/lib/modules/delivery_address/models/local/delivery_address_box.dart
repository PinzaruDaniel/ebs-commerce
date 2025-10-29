import 'package:objectbox/objectbox.dart';

@Entity()
class DeliveryAddressBox {
  @Id(assignable: true)
  int id;
  String deliveryType;
  String? comments;
  String? pickupLocation;
  String? country;
  String? region;
  String? city;
  String? postalCode;
  String? address;
  DeliveryAddressBox({
    this.id=0,
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
