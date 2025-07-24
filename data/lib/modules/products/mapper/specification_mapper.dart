import 'package:domain/modules/products/models/specification_entity.dart';

import '../models/remote/specification_api_dto.dart';

extension SpecificationApiDtoMapper on SpecificationApiDto{
  SpecificationEntity toEntity()=>SpecificationEntity(title: title, value: value);
}