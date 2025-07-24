// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryApiDto _$CategoryApiDtoFromJson(Map<String, dynamic> json) =>
    _CategoryApiDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryApiDtoToJson(_CategoryApiDto instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
