part of '../index.dart';

@freezed
abstract class StatesDataApiDto with _$StatesDataApiDto {
  const factory StatesDataApiDto({
    required String name,
    required List<StatesApiDto> states,
  }) = _StatesDataApiDto;

  factory StatesDataApiDto.fromJson(Map<String, dynamic> json) => _$StatesDataApiDtoFromJson(json);
}