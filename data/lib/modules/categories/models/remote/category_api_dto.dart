part of 'index.dart';

@freezed
abstract class CategoryApiDto with _$CategoryApiDto{
  const factory CategoryApiDto({
    required int id,
    required String name,
    required int level,
    required int? parent
}) = _CategoryApiDto;
  factory CategoryApiDto.fromJson(Map<String, dynamic> json)=>_$CategoryApiDtoFromJson(json);

}

