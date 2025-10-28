import 'package:domain/modules/user_information/models/index.dart';

abstract class UserInformationRepository{
  Future<void> setUserLocalCache(UserEntity user);
  Future<UserEntity>getUserLocalCache();

  Future<void> setPaymentMethodLocalCache(PaymentMethodEntity paymentMethod);
  Future<PaymentMethodEntity> getPaymentMethodLocalCache();
}