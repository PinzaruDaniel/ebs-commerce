import 'package:get/get.dart';
import '../view/cart_products_view_model.dart';

class MainAppController extends GetxController {
  RxList<CartItem> cartItems = RxList([]);

  void addToCart(CartItem item) {
    final index = cartItems.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      cartItems[index].quantity;
    } else {
      cartItems.add(item);
    }
  }

}
