import 'package:domain/modules/categories/category_entity.dart';
import 'package:presentation/view/category_view_model.dart';

extension CategoryViewModelMapper on CategoryEntity {
  CategoryViewModel get toModel {
    return CategoryViewModel(id: id, name: name);
  }
}
