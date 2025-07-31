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
  final int? stock;
  final int? sale;
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
    required this.sale,
    required this.description,
    required this.specification,
    required this.category,
  });
}

ProductViewModel get dummyProduct => ProductViewModel(
  id: -1,
  title: 'dummy',
  company: {},
  imageUrl: [],
  marks: [],
  price: null,
  stock: null,
  sale: null,
  description: '',
  specification: [],
  category: [],
);
