
import 'package:domain/modules/specifications/specification_entity.dart';

import '../modules/specifications/models/remote/index.dart';

extension SpecificationApiDtoMapper on SpecificationDataApiDto {
  SpecificationEntity toEntity() {
    return SpecificationEntity(
      title: attribute.name,
      value: value,
    );
  }
}