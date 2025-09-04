part of 'index.dart';

@freezed
abstract class ProductApiDto with _$ProductApiDto {
  const factory ProductApiDto({
    required int id,
    required String name,
     required Map<String, dynamic>? brand,
    required String? price,
    @JsonKey(name: 'discount_percent', defaultValue: null) String? discount,
    @JsonKey(name: 'discounted_price', defaultValue: null) String? discountedPrice,
    @JsonKey(name: 'attachments') required List<String>? imageUrl,
    required List<String>? marks,
    required int? stock,
    required String? description,
    @JsonKey(name: 'attributes') required List<SpecificationDataApiDto> specification,
    @JsonKey(name: 'categories') required List<List<CategoryApiDto>>? category,
  }) = _ProductApiDto;

  factory ProductApiDto.fromJson(Map<String, dynamic> json) => _$ProductApiDtoFromJson(json);
}
