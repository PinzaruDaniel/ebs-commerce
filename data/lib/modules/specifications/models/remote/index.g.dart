// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpecificationApiDto _$SpecificationApiDtoFromJson(Map<String, dynamic> json) =>
    _SpecificationApiDto(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$SpecificationApiDtoToJson(
  _SpecificationApiDto instance,
) => <String, dynamic>{'name': instance.name, 'value': instance.value};

_SpecificationResponseApiDto _$SpecificationResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _SpecificationResponseApiDto(
  specifications: (json['specifications'] as List<dynamic>)
      .map((e) => SpecificationDataApiDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SpecificationResponseApiDtoToJson(
  _SpecificationResponseApiDto instance,
) => <String, dynamic>{'specifications': instance.specifications};

_SpecificationDataApiDto _$SpecificationDataApiDtoFromJson(
  Map<String, dynamic> json,
) => _SpecificationDataApiDto(
  attribute: SpecificationApiDto.fromJson(
    json['attribute'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SpecificationDataApiDtoToJson(
  _SpecificationDataApiDto instance,
) => <String, dynamic>{'attribute': instance.attribute};
