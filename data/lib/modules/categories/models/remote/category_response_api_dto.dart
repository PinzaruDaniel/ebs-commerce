part of 'index.dart';

@freezed

abstract class CategoryResponseApiDto with _$CategoryResponseApiDto {
  const factory CategoryResponseApiDto({
    required int? count,
    required int? totalPages,
    required int? perPage,
    required int? currentPage,
    required List<CategoryApiDto> results,
  }) = _CategoryResponseApiDto;

  factory CategoryResponseApiDto.fromJson(Map<String, dynamic>json)=> _$CategoryResponseApiDtoFromJson(json);
}