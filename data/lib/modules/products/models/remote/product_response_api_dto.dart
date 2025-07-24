import 'package:data/modules/products/models/remote/product_api_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response_api_dto.freezed.dart';

part 'product_response_api_dto.g.dart';

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