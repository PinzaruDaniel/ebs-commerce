import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/authentification_page/authentification_page.dart';
import 'package:presentation/pages/checkout_page/checkout_page.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_page.dart';
import 'package:presentation/pages/greeting_page/greeting_page.dart';
import 'package:presentation/pages/home_page/home_page.dart';
import 'package:presentation/pages/orders_page/orders_page.dart';
import 'package:presentation/pages/products_display_page/products_display_page.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../pages/category_page/category_page.dart';
import '../../pages/contact_information_page/contact_information_page.dart';
import '../../pages/filter_page/filter_page.dart';
import '../../pages/product_detail_page/product_detail_page.dart';
import '../../pages/shopping_cart_page/shopping_cart_page.dart';
import '../../view/cart_products_view_model.dart';
import '../../view/product_view_model.dart';
import '../enum/enums.dart';

Route<T> createSharedAxisRoute<T>({required Widget page, SharedAxisTransitionType? transitionType}) {
  return PageRouteBuilder<T>(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SharedAxisTransition(
        fillColor: Colors.white,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: transitionType ?? SharedAxisTransitionType.horizontal,
        child: child,
      );
    },
  );
}
class SharedAxisCustomTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.horizontal,
      fillColor: Colors.white,
      child: child,
    );
  }
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


  static void openOrdersPage() {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => OrdersPage()));
    }
  }


  static void openShoppingCartPage() {
    if (Get.context != null) {
      Navigator.of(Get.context!).push(createSharedAxisRoute(page: ShoppingCartPage()));
    }
  }

  static void openGreetingPage() {
    if (Get.context != null) {
      Navigator.of(Get.context!).push(createSharedAxisRoute(page: GreetingPage()));
    }
  }

  static void openAuthPage() {
    if (Get.context != null) {
      Navigator.of(Get.context!).push(createSharedAxisRoute(page: AuthentificationPage()));
    }
  }

  static void openCategoryPickerPage({required Function onSave}) {
    if (Get.context != null) {
      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => CategoryPage(onSave: onSave)));
    }
  }

  static Widget openFilterPage() {
    return FilterPage();
  }

  static Widget openProductsDisplayPage({
    required ProductListType type,
    required String title,
    List<int>? selectedCategoryIds,
    SfRangeValues? priceRange,
  }) {
    return ProductsDisplayPage(
      title: title,
      type: type,
      selectedCategoryIds: selectedCategoryIds,
      priceRange: priceRange,
    );
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

  static void openContactInformationPage({required Function onSave, required UserViewModel? userViewModel}) {
    if (Get.context != null) {
      Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: (context) => ContactInformationPage(onSave: onSave, userViewModel: userViewModel),
        ),
      );
    }
  }

  static void openDeliveryAddressPage({
    required Function onSave,
    required DeliveryAddressViewModel? deliveryAddressVM,
  }) {
    if (Get.context != null) {
      Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: (context) => DeliveryAddressPage(onSave: onSave, deliveryAddressVM: deliveryAddressVM),
        ),
      );
    }
  }
}
