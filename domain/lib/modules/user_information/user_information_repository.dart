import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/models/index.dart';

abstract class UserInformationRepository {
  Future<void> setUser(UserEntity user);

  Stream<UserEntity?> getUser(int userId);

  Future<void> setDeliveryAddress({
    required int userId,
    required DeliveryAddressEntity deliveryAddress,
  });
  Future<void> setPaymentMethod({
    required int userId,
    required PaymentMethodEntity paymentMethod,
  });

  Future<DeliveryAddressEntity?> getDeliveryAddress(int userId);

  Future<PaymentMethodEntity?> getPaymentMethod(int userId);

  Future<Either<Failure, UserEntity>> getUserFromApi();
}
