part of 'index.dart';
@freezed
abstract class ProductResponseApiDto with _$ProductResponseApiDto{
  const factory ProductResponseApiDto({
    required int count,
    required int? totalPages,
    required int? perPage,
    required int? currentPage,
    required List<ProductApiDto> results,
}) = _ProductResponseApiDto;
  factory ProductResponseApiDto.fromJson(Map<String, dynamic>json)=>_$ProductResponseApiDtoFromJson(json);
}