import 'package:presentation/view/specification_view_model.dart';

class CartItem {
  final int id;
  final String title;
  final String? imageUrl;
  final String? price;
  final int? stock;
  final SpecificationViewModel? specification;
  int quantity;
  bool isSelected;

  CartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.stock,
    required this.specification,
    this.quantity = 1,
    this.isSelected = true,
  });
}
