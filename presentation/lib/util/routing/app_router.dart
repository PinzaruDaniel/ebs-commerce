import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/product_detail_page/product_detail_page.dart';
import '../../pages/shopping_cart_page/shopping_cart_page.dart';
import '../../view/product_view_model.dart';

class AppRouter {
  static void openDetailsPage({required ProductViewModel item }){
    if(Get.context!=null) {
      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) => ProductDetailPage(item: item)),
      );
    }
  }

  static void openShoppingCartPage(){
    if(Get.context!=null){
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ShoppingCartPage()));
    }
  }
}