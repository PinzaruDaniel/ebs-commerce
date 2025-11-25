part of '../index.dart';

@freezed
abstract class CountriesApiDto with _$CountriesApiDto {
  const factory CountriesApiDto({
    required int id,
    required String name,
    required String iso2,
    @JsonKey(name: 'phonecode') required String dialCode,
  }) = _CountriesApiDto;

  factory CountriesApiDto.fromJson(Map<String, dynamic> json) => _$CountriesApiDtoFromJson(json);
}
