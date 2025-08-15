part of 'index.dart';
@freezed
abstract class CountriesResponseApiDto with _$CountriesResponseApiDto {
  const factory CountriesResponseApiDto({
    required bool error,
    required String msg,
    required List<CountriesApiDto> data,
  }) = _CountriesResponseApiDto;

  factory CountriesResponseApiDto.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseApiDtoFromJson(json);
}