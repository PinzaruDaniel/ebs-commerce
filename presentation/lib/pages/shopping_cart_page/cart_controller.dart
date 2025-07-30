import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/view/cart_products_view_model.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = mainAppController.cartItems;
}
