part of 'index.dart';


@freezed
abstract class SpecificationResponseApiDto with _$SpecificationResponseApiDto {
  const factory SpecificationResponseApiDto({

       required List<SpecificationDataApiDto> specifications,
  }) = _SpecificationResponseApiDto;

  factory SpecificationResponseApiDto.fromJson(Map<String, dynamic> json) =>_$SpecificationResponseApiDtoFromJson(json);
}


