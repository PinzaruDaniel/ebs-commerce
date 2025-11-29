// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatesResponseApiDto _$StatesResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _StatesResponseApiDto(
  error: json['error'] as bool,
  msg: json['msg'] as String,
  data: StatesDataApiDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatesResponseApiDtoToJson(
  _StatesResponseApiDto instance,
) => <String, dynamic>{
  'error': instance.error,
  'msg': instance.msg,
  'data': instance.data,
};

_StatesApiDto _$StatesApiDtoFromJson(Map<String, dynamic> json) =>
    _StatesApiDto(
      name: json['name'] as String,
      code: json['state_code'] as String?,
    );

Map<String, dynamic> _$StatesApiDtoToJson(_StatesApiDto instance) =>
    <String, dynamic>{'name': instance.name, 'state_code': instance.code};

_StatesDataApiDto _$StatesDataApiDtoFromJson(Map<String, dynamic> json) =>
    _StatesDataApiDto(
      name: json['name'] as String,
      states: (json['states'] as List<dynamic>)
          .map((e) => StatesApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatesDataApiDtoToJson(_StatesDataApiDto instance) =>
    <String, dynamic>{'name': instance.name, 'states': instance.states};

_CitiesResponseApiDto _$CitiesResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _CitiesResponseApiDto(
  error: json['error'] as bool,
  msg: json['msg'] as String,
  data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CitiesResponseApiDtoToJson(
  _CitiesResponseApiDto instance,
) => <String, dynamic>{
  'error': instance.error,
  'msg': instance.msg,
  'data': instance.data,
};

_CountriesResponseApiDto _$CountriesResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _CountriesResponseApiDto(
  error: json['error'] as bool,
  msg: json['msg'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => CountriesApiDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CountriesResponseApiDtoToJson(
  _CountriesResponseApiDto instance,
) => <String, dynamic>{
  'error': instance.error,
  'msg': instance.msg,
  'data': instance.data,
};

_CountriesApiDto _$CountriesApiDtoFromJson(Map<String, dynamic> json) =>
    _CountriesApiDto(
      country: json['country'] as String,
      iso2: json['iso2'] as String,
    );

Map<String, dynamic> _$CountriesApiDtoToJson(_CountriesApiDto instance) =>
    <String, dynamic>{'country': instance.country, 'iso2': instance.iso2};

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

_FlagResponseApiDto _$FlagResponseApiDtoFromJson(Map<String, dynamic> json) =>
    _FlagResponseApiDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => FlagApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FlagResponseApiDtoToJson(_FlagResponseApiDto instance) =>
    <String, dynamic>{'data': instance.data};

_FlagApiDto _$FlagApiDtoFromJson(Map<String, dynamic> json) => _FlagApiDto(
  name: json['name'] as String,
  iso2: json['iso2'] as String,
  unicodeFlag: json['unicodeFlag'] as String,
);

Map<String, dynamic> _$FlagApiDtoToJson(_FlagApiDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iso2': instance.iso2,
      'unicodeFlag': instance.unicodeFlag,
    };

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
