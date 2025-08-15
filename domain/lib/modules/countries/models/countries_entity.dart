part of 'index.dart';

@freezed
abstract class CountriesEntity with _$CountriesEntity {
  const factory CountriesEntity({
    required String name,
    String? iso2,
  })= _CountriesEntity;
}
