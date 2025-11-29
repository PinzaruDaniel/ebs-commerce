import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/models/index.dart';

abstract class UserInformationRepository {
  Future<void> setUser(UserEntity user);

  Stream<UserEntity?> getUser(int idUser);

  Future<void> setDeliveryAddress({
    required int idUser,
    required DeliveryAddressEntity deliveryAddress,
  });
  Future<void> setPaymentMethod({
    required int idUser,
    required PaymentMethodEntity paymentMethod,
  });

  Future<DeliveryAddressEntity?> getDeliveryAddress(int idUser);

  Future<PaymentMethodEntity?> getPaymentMethod(int idUser);

  Future<Either<Failure, UserEntity>> getUserFromApi();
  Future<void> deleteAllUsers();
}
