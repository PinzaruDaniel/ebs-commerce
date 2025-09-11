import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/category_view_model.dart';
import 'package:presentation/view/specification_view_model.dart';

class ProductViewModel extends BaseViewModel {
  final int id;
  final String title;
  final Map<String, dynamic>? company;
  final List<String>? imageUrl;
  final List<String>? marks;
  final String? price;
  final String? discount;
  final String? discountedPrice;
  final int? stock;
  final String? description;
  final List<SpecificationViewModel> specification;
  final List<CategoryViewModel> category;

  ProductViewModel({
    required this.id,
    required this.title,
    required this.company,
    required this.imageUrl,
    required this.marks,
    required this.price,
    required this.stock,
    required this.discount,
    required this.discountedPrice,
    required this.description,
    required this.specification,
    required this.category,
  });
}
