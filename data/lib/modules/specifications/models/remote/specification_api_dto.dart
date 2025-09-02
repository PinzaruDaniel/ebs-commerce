part of 'index.dart';

@freezed
abstract class SpecificationApiDto with _$SpecificationApiDto {
  const factory SpecificationApiDto({
    required String name,
    required String value,
  }) = _SpecificationApiDto;

  factory SpecificationApiDto.fromJson(Map<String, dynamic> json) =>_$SpecificationApiDtoFromJson(json);
}


