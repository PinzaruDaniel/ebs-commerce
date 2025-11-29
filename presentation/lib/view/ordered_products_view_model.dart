import 'base_view_model.dart';

class OrderedProductsViewModel extends BaseViewModel {
  final int id;
  final String title;
  final String? imageUrl;
  final String? price;
  int quantity;

  OrderedProductsViewModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}
