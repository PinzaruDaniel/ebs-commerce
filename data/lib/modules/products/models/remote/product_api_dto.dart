part of 'index.dart';

@freezed
abstract class ProductApiDto with _$ProductApiDto {
  const factory ProductApiDto({
    required int id,
    required String name,
     required Map<String, dynamic>? brand,
    required String? price,
    required List<String>? imageUrl,
    required List<String>? marks,
    required int? stock,
    @JsonKey(name: 'discount', defaultValue: 0) int? discount,
    required String? description,
    required List<SpecificationApiDto>? specification,
    required List<CategoryApiDto>? category,
  }) = _ProductApiDto;

  factory ProductApiDto.fromJson(Map<String, dynamic> json) => _$ProductApiDtoFromJson(json);
}
