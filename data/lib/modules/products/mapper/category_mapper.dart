import 'package:domain/modules/products/models/category_entity.dart';

import '../models/remote/category_api_dto.dart';

extension CategoryApiDtoMapper on CategoryApiDto{
  CategoryEntity toEntity()=> CategoryEntity(id: id, name: name);
}