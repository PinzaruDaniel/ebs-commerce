import 'package:flutter/cupertino.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/view/cart_products_view_model.dart';

import 'package:get/get.dart';

import '../../util/routing/app_pop_up.dart';

class CartController extends GetxController {
  RxList<CartViewModel> cartItems = mainAppController.cartItems;

  void updateQuantity(int index, int newQuantity, BuildContext context) async {
    if (newQuantity == 0) {
      final shouldDelete = await AppPopUp.showConfirmationDialog(
        context: context,
        title: 'Remove Item?',
        content: 'Do you want to remove this item from your cart?',
      );
      if (shouldDelete) {
        cartItems.removeAt(index);
      } else {
        cartItems[index].quantity = 1;
        cartItems.refresh();
      }
    } else {
      cartItems[index].quantity = newQuantity;
      cartItems.refresh();
    }
  }
  List<CartViewModel> get selectedItems=>cartItems.where((e)=>e.isSelected==true).toList();
  bool get hasSelectedItems=>selectedItems.isNotEmpty;

}
