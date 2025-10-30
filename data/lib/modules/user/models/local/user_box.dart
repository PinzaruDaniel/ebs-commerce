import 'package:data/modules/delivery_address/models/local/delivery_address_box.dart';
import 'package:data/modules/payment_method/models/local/payment_method_box.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserBox {
  @Id(assignable: true)
  int id;
  String name;
  String surname;
  String number;
  String dialCode;
  String email;

  final deliveryAddressBox = ToOne<DeliveryAddressBox>();
  final paymentMethodBox = ToOne<PaymentMethodBox>();


  UserBox({
    this.id = 0,
    required this.name,
    required this.surname,
    required this.number,
    required this.dialCode,
    required this.email,
  });
}
