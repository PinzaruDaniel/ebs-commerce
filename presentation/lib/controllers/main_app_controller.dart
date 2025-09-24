import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../view/cart_products_view_model.dart';

class MainAppController extends GetxController {
  RxList<CartViewModel> cartItems = RxList([]);

  void addToCart(CartViewModel item) {
    final index = cartItems.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      cartItems[index].quantity;
    } else {
      cartItems.add(item);
    }
  }

  void changeLanguage(Locale locale, BuildContext context){
      context.setLocale(locale);
      Get.updateLocale(locale);

  }
}
