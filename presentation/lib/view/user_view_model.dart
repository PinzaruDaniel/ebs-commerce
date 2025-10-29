import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/payment_method_view_model.dart';

class UserViewModel extends BaseViewModel {
  final String name;
  final String surname;
  final String number;
  final String dialCode;
  final String email;
  DeliveryAddressViewModel? deliveryAddressViewModel;
  PaymentMethodViewModel? paymentMethodViewModel;

  UserViewModel({
    required this.name,
    required this.surname,
    required this.number,
    required this.dialCode,
    required this.email,
    this.deliveryAddressViewModel,
    this.paymentMethodViewModel,
  });
}
