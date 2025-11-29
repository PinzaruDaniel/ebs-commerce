part of '../index.dart';

@freezed
abstract class DialCodesEntity with _$DialCodesEntity {
  const factory DialCodesEntity({required String name, required String code, required String dialCode}) =
      _DialCodesEntity;
}
