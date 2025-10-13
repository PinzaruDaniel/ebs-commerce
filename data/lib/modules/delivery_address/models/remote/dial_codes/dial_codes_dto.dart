part of '../index.dart';

@freezed
abstract class DialCodesDto with _$DialCodesDto {
  const factory DialCodesDto({
    required String name,
    required String code,

    @JsonKey(name: "dial_code") required String dialCode,
  }) = _DialCodesDto;

  factory DialCodesDto.fromJson(Map<String, dynamic> json) => _$DialCodesDtoFromJson(json);
}
