part of 'index.dart';

@freezed
abstract class DeliveryAddressEntity with _$DeliveryAddressEntity {
  const factory DeliveryAddressEntity({
    int? id,
    required String deliveryType,
    String? comments,
    String? pickupLocation,
    String? country,
    String? region,
    String? city,
    String? postalCode,
    String? address,
  }) = _DeliveryAddressEntity;
}
