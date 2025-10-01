import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:domain/modules/specifications/specification_entity.dart';

import '../modules/specifications/models/remote/index.dart';

extension SpecificationApiDtoMapper on SpecificationDataApiDto {
  SpecificationEntity toEntity() {
    return SpecificationEntity(id: id, attributeId: attributeId, title: attribute.name, value: value);
  }
}

extension SpecificationEntityToBoxMapper on SpecificationEntity {
  SpecificationBox get toBox {
    return SpecificationBox(idSpec: id, attributeId: attributeId, attributeName: title, value: value);
  }
}

extension SpecificationBoxToEntityMapper on SpecificationBox {
  SpecificationEntity get toEntity {
    return SpecificationEntity(id: idSpec, attributeId: attributeId, title: attributeName, value: value);
  }
}
