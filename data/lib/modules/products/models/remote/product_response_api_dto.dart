part of 'index.dart';
@freezed
abstract class ProductResponseApiDto with _$ProductResponseApiDto{
  const factory ProductResponseApiDto({
    required int count,
    @JsonKey(name: 'total_pages')  required int? totalPages,
    @JsonKey(name: 'per_page') required int? perPage,
    @JsonKey(name: 'current_page')required int? currentPage,
    required List<ProductApiDto> results,
}) = _ProductResponseApiDto;
  factory ProductResponseApiDto.fromJson(Map<String, dynamic>json)=>_$ProductResponseApiDtoFromJson(json);
}