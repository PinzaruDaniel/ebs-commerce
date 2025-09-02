import 'package:data/mapper/specification_mapper.dart';
import 'package:domain/modules/specifications/specification_entity.dart';

import '../modules/specifications/models/remote/index.dart';

extension SpecificationResponseApiDtoMapper on SpecificationResponseApiDto {
  List<SpecificationEntity> toEntityList() {
    return specifications
        .map((specData) => specData.attribute.toEntity())
        .toList();
  }
}