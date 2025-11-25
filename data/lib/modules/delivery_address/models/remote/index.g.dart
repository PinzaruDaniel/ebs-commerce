// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatesApiDto _$StatesApiDtoFromJson(Map<String, dynamic> json) =>
    _StatesApiDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['iso2'] as String?,
    );

Map<String, dynamic> _$StatesApiDtoToJson(_StatesApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iso2': instance.code,
    };

_CitiesResponseApiDto _$CitiesResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _CitiesResponseApiDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$CitiesResponseApiDtoToJson(
  _CitiesResponseApiDto instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_CountriesApiDto _$CountriesApiDtoFromJson(Map<String, dynamic> json) =>
    _CountriesApiDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iso2: json['iso2'] as String,
      dialCode: json['phonecode'] as String,
    );

Map<String, dynamic> _$CountriesApiDtoToJson(_CountriesApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iso2': instance.iso2,
      'phonecode': instance.dialCode,
    };

_DialCodesDto _$DialCodesDtoFromJson(Map<String, dynamic> json) =>
    _DialCodesDto(
      name: json['name'] as String,
      code: json['code'] as String,
      dialCode: json['dial_code'] as String,
    );

Map<String, dynamic> _$DialCodesDtoToJson(_DialCodesDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'dial_code': instance.dialCode,
    };

_DialCodesResponseApiDto _$DialCodesResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _DialCodesResponseApiDto(
  data: (json['data'] as List<dynamic>)
      .map((e) => DialCodesDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DialCodesResponseApiDtoToJson(
  _DialCodesResponseApiDto instance,
) => <String, dynamic>{'data': instance.data};

_DeliveryAddressUserApiDto _$DeliveryAddressUserApiDtoFromJson(
  Map<String, dynamic> json,
) => _DeliveryAddressUserApiDto(
  street: json['street'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  zip: json['zip'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$DeliveryAddressUserApiDtoToJson(
  _DeliveryAddressUserApiDto instance,
) => <String, dynamic>{
  'street': instance.street,
  'city': instance.city,
  'state': instance.state,
  'zip': instance.zip,
  'country': instance.country,
};
