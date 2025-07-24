// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductResponseApiDto _$ProductResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _ProductResponseApiDto(
  count: (json['count'] as num).toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  perPage: (json['perPage'] as num?)?.toInt(),
  currentPage: (json['currentPage'] as num?)?.toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => ProductApiDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductResponseApiDtoToJson(
  _ProductResponseApiDto instance,
) => <String, dynamic>{
  'count': instance.count,
  'totalPages': instance.totalPages,
  'perPage': instance.perPage,
  'currentPage': instance.currentPage,
  'results': instance.results,
};
