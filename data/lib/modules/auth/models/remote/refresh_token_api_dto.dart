part of 'index.dart';

@freezed
abstract class RefreshTokenApiDto with $_RefreshTokenApiDto {
  const factory RefreshTokenApiDto({required String refreshToken}) = _RefreshTokenApiDto;

  factory RefreshTokenApiDto.fromJson(Map<String, dynamic> json) => _RefreshTokenApiDtoFromJson(json);
}
