part of '../index.dart';

@freezed
abstract class CitiesResponseEntity with _$CitiesResponseEntity {
  const factory CitiesResponseEntity({
    required int id,
    required String name,
  }) = _CitiesResponseEntity;
}
