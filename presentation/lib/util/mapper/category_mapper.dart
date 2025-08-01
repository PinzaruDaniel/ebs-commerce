import 'package:domain/modules/categories/models/index.dart';
import 'package:presentation/view/category_view_model.dart';

extension CategoryViewModelMapper on CategoryEntity {
  CategoryViewModel get toModel {
   return CategoryViewModel(id: id, name: name, level: level, parent: parent);
  }
}
