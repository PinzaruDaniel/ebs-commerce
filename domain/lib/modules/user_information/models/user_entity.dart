part of 'index.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    int? idUser,
    required String name,
    required String surname,
    required String? number,
    required String? dialCode,
    required String email,
    required String? imageUrl,
    required DeliveryAddressEntity? deliveryAddressEntity,
    required PaymentMethodEntity? paymentMethodEntity,
  }) = _UserEntity;
}
