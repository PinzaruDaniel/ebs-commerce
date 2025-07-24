
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_api_dto.freezed.dart';
part 'category_api_dto.g.dart';
@freezed
abstract class CategoryApiDto with _$CategoryApiDto{
  const factory CategoryApiDto({
    required int id,
    required String name,
}) = _CategoryApiDto;
  factory CategoryApiDto.fromJson(Map<String, dynamic> json)=>_$CategoryApiDtoFromJson(json);

}

