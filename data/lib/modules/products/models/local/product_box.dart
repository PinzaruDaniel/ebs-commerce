part of 'index.dart';

@Entity()
@freezed
abstract class ProductBox with _$ProductLocalDto {
  const factory ProductBox({
    @Id(assignable: true) required int id,
    required String name,
    required String? price,
    required String? discount,
    required String? discountedPrice,
    required List<String>? imageUrl,
    required List<String>? marks,
    required int? stock,
    required String? description,
  }) = _ProductBox;

  factory ProductBox.fromJson(Map<String, dynamic> json) => _$ProductBoxFromJson(json);
}