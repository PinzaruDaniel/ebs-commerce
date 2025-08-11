import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/checkout_page.dart';
import 'package:presentation/pages/filtered_page/filter_page.dart';
import 'package:presentation/pages/products_display_page/products_display_page.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/product_list_type_enum.dart';

import '../../pages/category_picker_page/category_picker_page.dart';
import '../../pages/product_detail_page/product_detail_page.dart';
import '../../pages/shopping_cart_page/shopping_cart_page.dart';
import '../../view/product_view_model.dart';

class AppRouter {
  static void openDetailsPage({required ProductViewModel item}) {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ProductDetailPage(item: item)));
    }
  }

  static void openShoppingCartPage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ShoppingCartPage()));
    }
  }

  static void openCategoryPickerPage(){
    if(Get.context != null){
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> CategoryPickerPage()));
    }
  }

  static void openFilterPage(){
    if(Get.context !=null){
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> FilterPage()));
    }
  }
  static void openProductsDisplayPage({required ProductListType type, required String title}){
    if(Get.context !=null){
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> ProductsDisplayPage( title: title, type: type,)));
    }
  }
  static void openCheckoutPage(){
    if(Get.context !=null){
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> CheckoutPage()));
    }
  }


}
