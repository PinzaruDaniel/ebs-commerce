import 'package:freezed_annotation/freezed_annotation.dart';

part 'specification_api_dto.freezed.dart';

part 'specification_api_dto.g.dart';

@freezed
abstract class SpecificationApiDto with _$SpecificationApiDto {
  const factory SpecificationApiDto({
    required String title,
    required String value,
  }) = _SpecificationApiDto;

  factory SpecificationApiDto.fromJson(Map<String, dynamic> json) =>_$SpecificationApiDtoFromJson(json);
}


