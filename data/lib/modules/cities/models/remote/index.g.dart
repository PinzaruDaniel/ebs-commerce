// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
