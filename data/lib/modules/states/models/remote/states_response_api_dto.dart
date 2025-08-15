part of 'index.dart';

@freezed
abstract class StatesResponseApiDto with _$StatesResponseApiDto {
  const factory StatesResponseApiDto({
    required bool error,
    required String msg,
    required StatesDataApiDto data,
  }) = _StatesResponseApiDto;

  factory StatesResponseApiDto.fromJson(Map<String, dynamic> json) => _$StatesResponseApiDtoFromJson(json);
}