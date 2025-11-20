import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/authentification_page/authentification_page.dart';
import 'package:presentation/pages/checkout_page/checkout_page.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_page.dart';
import 'package:presentation/pages/greeting_page/greeting_page.dart';
import 'package:presentation/pages/home_page/home_page.dart';
import 'package:presentation/pages/orders_page/orders_page.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../pages/category_page/category_page.dart';
import '../../pages/contact_information_page/contact_information_page.dart';
import '../../pages/shopping_cart_page/shopping_cart_page.dart';
import '../../view/cart_products_view_model.dart';

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
class AppRouter {
  static void _route({
    required Widget page,
    bool removeUntil = false,
    bool withAnimation = false,
    SharedAxisTransitionType transitionType = SharedAxisTransitionType.horizontal,
  }) {
    if (Get.context != null) {
      if (removeUntil) {
        Navigator.of(
          Get.context!,
          rootNavigator: true,
        ).pushAndRemoveUntil(CupertinoPageRoute(builder: (_) => page), (Route<dynamic> route) => false);
      } else if (withAnimation) {
        Navigator.of(Get.context!).push(createSharedAxisRoute(page: page, transitionType: transitionType));
      } else {
        Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => page));
      }
    }
  }

  static void openHomePage({bool removeUntil = false}) {
    _route(page: HomePage(), removeUntil: removeUntil);
  }

  //Todo: to change all
  static void openOrdersPage() {
    _route(page: OrdersPage());
  }

  static void openShoppingCartPage() {
    _route(page: ShoppingCartPage(), withAnimation: true);
  }

  static void openGreetingPage() {
    _route(page: GreetingPage(), withAnimation: true);
  }

  static void openAuthPage() {
    _route(page: AuthentificationPage(), withAnimation: true);
  }

  static void openCategoryPickerPage({required Function onSave}) {
    _route(page: CategoryPage(onSave: onSave), withAnimation: true);
  }

  static void openCheckoutPage({required List<CartViewModel> items}) {
    _route(
      page: CheckoutPage(items: items),
      withAnimation: true,
      transitionType: SharedAxisTransitionType.vertical,
    );
  }

  static void openContactInformationPage({required Function onSave, required UserViewModel? userViewModel}) {
    _route(
      page: ContactInformationPage(onSave: onSave, userViewModel: userViewModel),
    );
  }

  static void openDeliveryAddressPage({
    required Function onSave,
    required DeliveryAddressViewModel? deliveryAddressVM,
  }) {
    _route(
      page: DeliveryAddressPage(onSave: onSave, deliveryAddressVM: deliveryAddressVM),
    );
  }
}
