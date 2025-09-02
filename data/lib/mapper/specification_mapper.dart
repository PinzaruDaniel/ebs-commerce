
import 'package:domain/modules/specifications/specification_entity.dart';

import '../modules/specifications/models/remote/index.dart';

extension SpecificationApiDtoMapper on SpecificationApiDto{
  SpecificationEntity toEntity()=>SpecificationEntity(title: name, value: value);
}