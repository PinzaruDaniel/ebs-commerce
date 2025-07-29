

import 'package:presentation/view/base_view_model.dart';

class CategoryViewModel extends BaseViewModel{
  final int id;
  final String name;

  CategoryViewModel( {
    required this.id,
    required this.name,
});
}