part of 'index.dart';

@freezed
abstract class DeliveryAddressUserApiDto with _$DeliveryAddressUserApiDto{
  const factory DeliveryAddressUserApiDto({
    required String street,
    required String city,
    required String state,
    required String zip,
    required String country,
})=_DeliveryAddressUserApiDto;
  factory DeliveryAddressUserApiDto.fromJson(Map<String, dynamic> json)=>_$DeliveryAddressUserApiDtoFromJson(json);
}