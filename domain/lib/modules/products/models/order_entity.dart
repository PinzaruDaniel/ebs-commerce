part of 'index.dart';


@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required int id,
    required DateTime dateTime,
    required List<OrderedProductEntity> products,

  })=_OrderEntity;
}