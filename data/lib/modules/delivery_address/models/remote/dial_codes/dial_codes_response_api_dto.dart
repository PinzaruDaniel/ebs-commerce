part of '../index.dart';
@freezed
abstract class DialCodesResponseApiDto with _$DialCodesResponseApiDto {
  const factory DialCodesResponseApiDto({
    required List<DialCodesDto> data
})= _DialCodesResponseApiDto;
  factory DialCodesResponseApiDto.fromJson(Map<String, dynamic> json)=> _$DialCodesResponseApiDtoFromJson(json);
}