/*
import 'package:flutter/cupertino.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/view/cart_products_view_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  void updateCartItemQuantity(int index, int newQuantity, BuildContext context) async {
      cartItems[index].quantity = newQuantity;
      cartItems.refresh();
  }

  void removeCartItem(int index){
    cartItems.removeAt(index);
    cartItems.refresh();
  }

  List<CartViewModel> get selectedCartItemsItems => cartItems.where((e) => e.isSelected == true).toList();

}
*/
