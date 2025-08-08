
part of 'index.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String name,
    required Map<String, dynamic>? brand,
    required String? price,
    required String? discount,
    required String? discountedPrice,
    required List<String>? imageUrl,
    required List<String>? marks,
    required int? stock,
    required String? description,
    required List<SpecificationEntity>? specification,
    required List<CategoryEntity>? category,
  }) = _ProductEntity;

}
