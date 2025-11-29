part of '../index.dart';

@freezed
abstract class FlagResponseApiDto with _$FlagResponseApiDto{
  const factory FlagResponseApiDto({
    required List<FlagApiDto> data,
})=_FlagResponseApiDto;
  factory FlagResponseApiDto.fromJson(Map<String, dynamic> json)=> _$FlagResponseApiDtoFromJson(json);
}