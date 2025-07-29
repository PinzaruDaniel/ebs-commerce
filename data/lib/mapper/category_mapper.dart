import 'package:domain/modules/categories/models/index.dart';
import '../modules/categories/models/remote/index.dart';

extension CategoryApiDtoMapper on CategoryApiDto{
  CategoryEntity toEntity()=> CategoryEntity(id: id, name: name);
}