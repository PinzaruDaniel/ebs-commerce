part of '../index.dart';

@freezed
abstract class FlagEntity with _$FlagEntity {
  const factory FlagEntity({
    required String name,
    required String iso2,
    required String unicodeFlag,
})= _FlagEntity;
}