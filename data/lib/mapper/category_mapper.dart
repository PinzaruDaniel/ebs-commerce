
import 'package:domain/modules/categories/category_entity.dart';

import '../modules/categories/models/remote/index.dart';

extension CategoryApiDtoMapper on CategoryApiDto{
  CategoryEntity toEntity()=> CategoryEntity(id: id, name: name);
}