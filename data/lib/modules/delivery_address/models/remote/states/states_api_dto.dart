part of '../index.dart';

@freezed
abstract class StatesApiDto with _$StatesApiDto {
  const factory StatesApiDto({
    required int id,
    required String name,
    @JsonKey(name: 'iso2')  String? code,
  }) = _StatesApiDto;

  factory StatesApiDto.fromJson(Map<String, dynamic> json) => _$StatesApiDtoFromJson(json);
}