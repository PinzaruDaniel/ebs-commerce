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
    _StatesApiDto(name: json['name'] as String);

Map<String, dynamic> _$StatesApiDtoToJson(_StatesApiDto instance) =>
    <String, dynamic>{'name': instance.name};

_StatesDataApiDto _$StatesDataApiDtoFromJson(Map<String, dynamic> json) =>
    _StatesDataApiDto(
      name: json['name'] as String,
      states: (json['states'] as List<dynamic>)
          .map((e) => StatesApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatesDataApiDtoToJson(_StatesDataApiDto instance) =>
    <String, dynamic>{'name': instance.name, 'states': instance.states};
