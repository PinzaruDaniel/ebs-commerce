// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpecificationApiDto _$SpecificationApiDtoFromJson(Map<String, dynamic> json) =>
    _SpecificationApiDto(name: json['name'] as String);

Map<String, dynamic> _$SpecificationApiDtoToJson(
  _SpecificationApiDto instance,
) => <String, dynamic>{'name': instance.name};

_SpecificationDataApiDto _$SpecificationDataApiDtoFromJson(
  Map<String, dynamic> json,
) => _SpecificationDataApiDto(
  id: (json['id'] as num).toInt(),
  attributeId: (json['attribute_id'] as num).toInt(),
  attribute: SpecificationApiDto.fromJson(
    json['attribute'] as Map<String, dynamic>,
  ),
  value: json['value'] as String,
);

Map<String, dynamic> _$SpecificationDataApiDtoToJson(
  _SpecificationDataApiDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'attribute_id': instance.attributeId,
  'attribute': instance.attribute,
  'value': instance.value,
};
