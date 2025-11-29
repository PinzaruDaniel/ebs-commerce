import 'package:data/modules/categories/models/local/category_box.dart';
import 'package:domain/modules/categories/models/index.dart';
import '../modules/categories/models/remote/index.dart';

extension CategoryApiDtoMapper on CategoryApiDto {
  CategoryEntity toEntity() => CategoryEntity(id: id, name: name, level: level, parent: parent);
}

extension CategoryEntityToBoxMapper on CategoryEntity {
  CategoryBox get toBox {
    return CategoryBox(idCategory: id, name: name, level: level, parent: parent);
  }
}

extension CategoryBoxToEntityMapper on CategoryBox {
  CategoryEntity get toEntity {
    return CategoryEntity(id: idCategory, name: name, level: level, parent: parent);
  }
}
