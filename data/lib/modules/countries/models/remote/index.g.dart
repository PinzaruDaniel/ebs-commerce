// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CountriesApiDto _$CountriesApiDtoFromJson(Map<String, dynamic> json) =>
    _CountriesApiDto(
      name: json['name'] as String,
      iso2: json['iso2'] as String?,
    );

Map<String, dynamic> _$CountriesApiDtoToJson(_CountriesApiDto instance) =>
    <String, dynamic>{'name': instance.name, 'iso2': instance.iso2};

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
