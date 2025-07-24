import 'package:data/modules/products/models/remote/specification_api_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_api_dto.dart';

part 'product_api_dto.freezed.dart';

part 'product_api_dto.g.dart';

@freezed
abstract class ProductApiDto with _$ProductApiDto {
  const factory ProductApiDto({
    required int id,
    required String name,
    @JsonKey(name: 'brand') required Map<String, dynamic>? brandMap,
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
