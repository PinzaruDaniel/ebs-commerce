part of 'index.dart';

@freezed
abstract class OrderedProductEntity with _$OrderedProductEntity{
  const factory OrderedProductEntity({
    required int idProduct,
    required String title,
    required String? imageUrl,
    required String? price,
    required int quantity,
})= _OrderedProductEntity;
}