import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:domain/modules/specifications/specification_entity.dart';

import '../modules/specifications/models/remote/index.dart';

extension SpecificationApiDtoMapper on SpecificationDataApiDto {
  SpecificationEntity toEntity() {
    return SpecificationEntity(title: attribute.name, value: value);
  }
}

extension SpecificationEntityToBoxMapper on SpecificationEntity {
  SpecificationBox get toBox {
    return SpecificationBox(attributeName: title, value: value);
  }
}
extension SpecificationBoxToEntityMapper on SpecificationBox {
  SpecificationEntity get toEntity {
    return SpecificationEntity(title: attributeName, value: value);
  }
}