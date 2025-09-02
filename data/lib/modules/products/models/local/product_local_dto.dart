part of 'index.dart';

@Entity()
@freezed
 abstract class ProductLocalDto with _$ProductLocalDto {
  const factory ProductLocalDto({
    @Id(assignable: true) required int id,
    required String name,
    required String? price,
    required String? discount,
    required String? discountedPrice,
    required List<String>? imageUrl,
    required List<String>? marks,
    required int? stock,
    required String? description,
  }) = _ProductLocalDto;

  factory ProductLocalDto.fromJson(Map<String, dynamic> json) => _$ProductLocalDtoFromJson(json);
}