part of '../index.dart';

@freezed
abstract class CountriesApiDto with _$CountriesApiDto {
  const factory CountriesApiDto({
    required String country,
    required String iso2,
  }) = _CountriesApiDto;

  factory CountriesApiDto.fromJson(Map<String, dynamic> json) => _$CountriesApiDtoFromJson(json);
}
