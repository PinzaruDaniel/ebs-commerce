import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/view/cart_products_view_model.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartViewModel> cartItems = mainAppController.cartItems;

  List<CartViewModel> get selectedItems=>cartItems.where((e)=>e.isSelected==true).toList();
  bool get hasSelectedItems=>selectedItems.isNotEmpty;

}
