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
import '../../pages/shopping_cart_page/shopping_cart_page.dart';
import '../../view/cart_products_view_model.dart';
import '../../view/product_view_model.dart';
import '../enum/enums.dart';
import 'package:animations/animations.dart';

Route<T> createSharedAxisRoute<T>({required Widget page, SharedAxisTransitionType? transitionType}) {
  return PageRouteBuilder<T>(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SharedAxisTransition(
        fillColor: Colors.white ,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: transitionType ?? SharedAxisTransitionType.horizontal,
        child: child,
      );
    },
  );
}

class AppRouter {
  static void openHomePage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  static Widget detailsPage({required ProductViewModel item}) {
    return ProductDetailPage(item: item);
  }

/*  static void openDetailsPage({required ProductViewModel item}) {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ProductDetailPage(item: item)));
    }
  }*/

  static void openShoppingCartPage() {
    if (Get.context != null) {
      Navigator.of(Get.context!).push(createSharedAxisRoute(page: ShoppingCartPage()));
    }
  }

  static void openCategoryPickerPage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => CategoryPage()));
    }
  }


  static Widget openFilterPage(){
    return FilterPage();
  }

  static Widget openProductsDisplayPage({required ProductListType type, required String title}) {
      return  ProductsDisplayPage(title: title, type: type);

  }

  static void openCheckoutPage({required List<CartViewModel> items}) {
    if (Get.context != null) {
      Navigator.of(Get.context!).push(
        createSharedAxisRoute(
          page: CheckoutPage(items: items),
          transitionType: SharedAxisTransitionType.vertical,
        ),
      );
    }
  }

  static void openContactInformationPage({required Function onSave, }) {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ContactInformationPage(onSave: onSave)));
    }
  }

  static void openDeliveryAddressPage({required Function onSave}) {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => DeliveryAddressPage(onSave: onSave)));
    }
  }
}
