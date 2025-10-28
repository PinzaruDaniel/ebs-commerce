part of '../index.dart';
@freezed
abstract class PaymentMethodEntity with _$PaymentMethodEntity{
  const factory PaymentMethodEntity({
    required int id,
    required String key,
    required String titleKey,
})=_PaymentMethodEntity;
}