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
      code: json['state_code'] as String,
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
