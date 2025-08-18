part of '../index.dart';

@freezed
abstract class StatesApiDto with _$StatesApiDto {
  const factory StatesApiDto({
    required String name,
    @JsonKey(name: 'state_code') required String code,
  }) = _StatesApiDto;

  factory StatesApiDto.fromJson(Map<String, dynamic> json) => _$StatesApiDtoFromJson(json);
}