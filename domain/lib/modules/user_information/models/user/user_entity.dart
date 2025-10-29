part of '../index.dart';

@freezed
abstract class UserEntity with _$UserEntity{
  const factory UserEntity({
    int? id,
    required String name,
    required String surname,
    required String number,
    required String dialCode,
    required String email,
    required DeliveryAddressEntity? deliveryAddressEntity,
    required PaymentMethodEntity? paymentMethodEntity,
})=_UserEntity;
}