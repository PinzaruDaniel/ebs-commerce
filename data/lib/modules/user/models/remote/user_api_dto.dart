part of 'index.dart';

@freezed
abstract class UserApiDto with _$UserApiDto {
  const factory UserApiDto({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    String? imageUrl,
  }) = _UserApiDto;
  factory UserApiDto.fromJson(Map<String, dynamic> json)=>_$UserApiDtoFromJson(json);
}
