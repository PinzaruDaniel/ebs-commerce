// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryApiDto _$CategoryApiDtoFromJson(Map<String, dynamic> json) =>
    _CategoryApiDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      level: (json['level'] as num).toInt(),
      parent: (json['parent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryApiDtoToJson(_CategoryApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'parent': instance.parent,
    };

_CategoryResponseApiDto _$CategoryResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _CategoryResponseApiDto(
  totalPages: (json['total_pages'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => CategoryApiDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryResponseApiDtoToJson(
  _CategoryResponseApiDto instance,
) => <String, dynamic>{
  'total_pages': instance.totalPages,
  'per_page': instance.perPage,
  'current_page': instance.currentPage,
  'results': instance.results,
};
