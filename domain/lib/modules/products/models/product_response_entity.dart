part of 'index.dart';

@freezed
abstract class ProductResponseEntity with _$ProductResponseEntity {
  const factory ProductResponseEntity({
    required int count,
    required int? totalPages,
    required int? perPage,
    required int? currentPage,
    required List<ProductEntity> response,
  }) = _ProductResponseEntity;
}
