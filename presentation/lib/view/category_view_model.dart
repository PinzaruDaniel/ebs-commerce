

import 'package:presentation/view/base_view_model.dart';

class CategoryViewModel extends BaseViewModel{
  final int id;
  final String name;
  final int level;
  final int? parent;

  CategoryViewModel( {
    required this.id,
    required this.name,
    required this.level,
    required this.parent,
});
}