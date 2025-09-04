part of 'index.dart';

@freezed
abstract class SpecificationDataApiDto with _$SpecificationDataApiDto {
  const factory SpecificationDataApiDto({required SpecificationApiDto attribute, required String value}) =
  _SpecificationDataApiDto;

  factory SpecificationDataApiDto.fromJson(Map<String, dynamic> json) => _$SpecificationDataApiDtoFromJson(json);
}