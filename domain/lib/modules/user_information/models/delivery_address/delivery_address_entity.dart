part of '../index.dart';

@freezed
abstract class DeliveryAddressEntity with _$DeliveryAddressEntity {
  const factory DeliveryAddressEntity({
    required int id,
    required String deliveryType,
    required String? comments,
    required String? pickupLocation,
    required String? country,
    required String? region,
    required String? city,
    required String? postalCode,
    required String? address,
  }) = _DeliveryAddressEntity;
}
