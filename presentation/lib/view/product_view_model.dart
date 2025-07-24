import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/category_view_model.dart';
class Specification {
  final String title;
  final String value;

  Specification({
    required this.title,
    required this.value,
  });
}
class ProductViewModel extends BaseViewModel {
  final int id;
  final String title;
  final String? company;
  final List<String>? imageUrl;
  final List<String>? marks;
  final String? price;
  final int? stock;
  final int? sale;
  final String? description;
  final List<Specification> specification;
  final List<CategoryViewModel> category;

  ProductViewModel({
    required this.id,
    required this.title,
    required this.company,
    required this.imageUrl,
    required this.marks,
    required this.price,
    required this.stock,
    required this.sale,
    required this.description,
    required this.specification,
    required this.category,
  });
}
