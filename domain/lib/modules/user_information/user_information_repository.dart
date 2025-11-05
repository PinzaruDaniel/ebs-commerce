import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/user_information/models/index.dart';

import '../delivery_address/models/index.dart';
import '../payment_method/index.dart';

abstract class UserInformationRepository {
  Future<void> setUser(UserEntity user);

  Future<UserEntity?> getUser();

  Future<void> setDeliveryAddress(DeliveryAddressEntity deliveryAddress);

  Future<void> setPaymentMethod(PaymentMethodEntity paymentMethod);

  Future<DeliveryAddressEntity?> getDeliveryAddress();

  Future<PaymentMethodEntity?> getPaymentMethod();
  Future<Either<Failure, UserEntity>> getUserFromApi();
}
