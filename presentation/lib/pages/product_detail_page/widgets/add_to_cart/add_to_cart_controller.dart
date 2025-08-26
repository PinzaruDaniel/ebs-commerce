import 'package:get/get.dart';

import '../../../../view/cart_products_view_model.dart';
import '../../../../view/product_view_model.dart';

class AddToCartController extends GetxController {
  RxList<CartViewModel> cartItems = RxList([]);
  Rxn<CartViewModel> cartItem = Rxn<CartViewModel>();

  CartViewModel initCartItem(ProductViewModel item) {


    final itemToAdd = CartViewModel(
      id: item.id,
      title: item.title,
      imageUrl: item.imageUrl != null && item.imageUrl!.isNotEmpty
          ? item.imageUrl!.first
          : null,
      price: item.price,
      discountedPrice: item.discountedPrice,
      stock: item.stock,
      specification: item.specification.isNotEmpty ? item.specification.first : null,
      quantity: 1,
    );
    cartItem.value = itemToAdd;
    cartItem.refresh();
    return itemToAdd;
  }
}