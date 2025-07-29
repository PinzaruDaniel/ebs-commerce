part of 'index.dart';

@freezed

abstract class CategoryResponseApiDto with _$CategoryResponseApiDto {
  const factory CategoryResponseApiDto({
    @JsonKey(name: 'total_pages')  required int? totalPages,
    @JsonKey(name: 'per_page') required int? perPage,
    @JsonKey(name: 'current_page')required int? currentPage,
    required List<CategoryApiDto> results,
  }) = _CategoryResponseApiDto;

  factory CategoryResponseApiDto.fromJson(Map<String, dynamic>json)=> _$CategoryResponseApiDtoFromJson(json);
}