part of '../index.dart';

@freezed
abstract class CitiesResponseApiDto with _$CitiesResponseApiDto {
  const factory CitiesResponseApiDto({required int id, required String name}) = _CitiesResponseApiDto;

  factory CitiesResponseApiDto.fromJson(Map<String, dynamic> json) => _$CitiesResponseApiDtoFromJson(json);
}
