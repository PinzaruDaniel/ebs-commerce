import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/specification_view_model.dart';

class CartViewModel extends BaseViewModel {
  final int id;
  final String title;
  final String? imageUrl;
  final String? price;
  final String? discountedPrice;
  final int? stock;
  final SpecificationViewModel? specification;
  int quantity;
  bool? isSelected;

  CartViewModel( {
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.discountedPrice,
    required this.stock,
    required this.specification,
    this.quantity = 1,
    this.isSelected = true,
  });
}
