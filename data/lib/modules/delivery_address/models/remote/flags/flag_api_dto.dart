part of '../index.dart';

@freezed
abstract class FlagApiDto with _$FlagApiDto {
  const factory FlagApiDto({
    required String name,
    required String iso2,
    required String unicodeFlag
})= _FlagApiDto;
  factory FlagApiDto.fromJson(Map<String, dynamic> json)=>_$FlagApiDtoFromJson(json);
}