import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/payment_method_view_model.dart';

class UserViewModel extends BaseViewModel {
  int? idUser;
  final String? name;
  final String? surname;
  final String? number;
  final String? dialCode;
  final String? email;
  final String? password;
  final String? imageUrl;
  DeliveryAddressViewModel? deliveryAddressViewModel;
  PaymentMethodViewModel? paymentMethodViewModel;

  UserViewModel({
    this.idUser,
    this.name,
    this.surname,
    this.number,
    this.dialCode,
    this.email,
    this.password,
    this.imageUrl,
    this.deliveryAddressViewModel,
    this.paymentMethodViewModel,
  });
}
