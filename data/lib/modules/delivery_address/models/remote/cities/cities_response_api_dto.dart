part of '../index.dart';

@freezed
abstract class CitiesResponseApiDto with _$CitiesResponseApiDto {
const factory CitiesResponseApiDto({
required bool error,
required String msg,
required List<String> data,
}) = _CitiesResponseApiDto;

factory CitiesResponseApiDto.fromJson(Map<String, dynamic> json) =>
_$CitiesResponseApiDtoFromJson(json);
}