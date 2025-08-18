part of '../index.dart';

@freezed
abstract class CitiesResponseEntity with _$CitiesResponseEntity {
  const factory CitiesResponseEntity({
    required bool error,
    required String msg,
    required List<String> data,
  }) = _CitiesResponseEntity;
}
