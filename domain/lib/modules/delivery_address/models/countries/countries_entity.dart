part of '../index.dart';

@freezed
abstract class CountriesEntity with _$CountriesEntity {
  const factory CountriesEntity({
    required int id,
    required String name,
    required String iso2,
    required String dialCode
  })= _CountriesEntity;
}
