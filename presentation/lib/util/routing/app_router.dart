import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/checkout_page.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_page.dart';
import 'package:presentation/pages/filtered_page/filter_page.dart';
import 'package:presentation/pages/home_page/home_page.dart';
import 'package:presentation/pages/products_display_page/products_display_page.dart';
import '../../pages/category_page/category_page.dart';
import '../../pages/contact_information_page/contact_information_page.dart';
import '../../pages/product_detail_page/product_detail_page.dart';
import '../../pages/shopping_cart_page/enum/product_type.dart';
import '../../pages/shopping_cart_page/shopping_cart_page.dart';
import '../../view/cart_products_view_model.dart';
import '../../view/product_view_model.dart';

class AppRouter {

  static void openHomePage(){
    if(Get.context != null){
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

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

  static void openCategoryPickerPage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => CategoryPage()));
    }
  }

  static void openFilterPage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => FilterPage()));
    }
  }

  static void openProductsDisplayPage({required ProductListType type, required String title}) {
    if (Get.context != null) {
      Navigator.push(
          Get.context!, MaterialPageRoute(builder: (context) => ProductsDisplayPage(title: title, type: type,)));
    }
  }

  static void openCheckoutPage({required List<CartViewModel> items}) {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => CheckoutPage(items: items,)));
    }
  }

  static void openContactInformationPage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ContactInformationPage()));
    }
  }

  static void openDeliveryAddressPage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => DeliveryAddressPage()));

    }
  }


}