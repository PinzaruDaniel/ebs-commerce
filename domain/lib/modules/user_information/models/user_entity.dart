part of 'index.dart';

@freezed
abstract class UserEntity with _$UserEntity{
  const factory UserEntity({
    int? id,
    required String name,
    required String surname,
    String? number,
    String? dialCode,
    required String email,
     DeliveryAddressEntity? deliveryAddressEntity,
     PaymentMethodEntity? paymentMethodEntity,
})=_UserEntity;

}