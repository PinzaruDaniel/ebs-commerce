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
import '../../pages/product_detail_page/product_detail_page.dart';
import '../../pages/shopping_cart_page/shopping_cart_page.dart';
import '../../view/cart_products_view_model.dart';
import '../../view/product_view_model.dart';

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
    Function()? onGoBack,
    SharedAxisTransitionType transitionType = SharedAxisTransitionType.horizontal,
  }) {
    if (Get.context != null) {
      if (withAnimation && removeUntil) {
        Navigator.of(Get.context!, rootNavigator: true).pushAndRemoveUntil(
          createSharedAxisRoute(page: page, transitionType: transitionType),
          (Route<dynamic> route) => false,
        );
        return;
      }
      if (removeUntil) {
        Navigator.of(
          Get.context!,
          rootNavigator: true,
        ).pushAndRemoveUntil(CupertinoPageRoute(builder: (_) => page), (Route<dynamic> route) => false);
        return;
      }
      if (withAnimation) {
        Navigator.of(Get.context!).push(createSharedAxisRoute(page: page, transitionType: transitionType)).then((_) {
          if (onGoBack != null) onGoBack.call();
        });
        return;
      }
      Navigator.push(Get.context!, CupertinoPageRoute(builder: (_) => page));
    }
  }

  static void openHomePage({bool removeUntil = false}) {
    _route(page: HomePage(), removeUntil: removeUntil, withAnimation: true);
  }

  static void openProductsDetailPage(ProductViewModel item) {
    _route(page: ProductDetailPage(item: item), withAnimation: true);
  }

  static void openOrdersPage() {
    _route(page: OrdersPage());
  }

  static void openShoppingCartPage({Function()? onGoBack}) {
    _route(page: ShoppingCartPage(), withAnimation: true, onGoBack: onGoBack);
  }

  static void openGreetingPage({bool removeUntil = false, bool withAnimation = true}) {
    _route(page: GreetingPage(), withAnimation: withAnimation, removeUntil: removeUntil);
  }

  /*static void openGreetingPage({bool removeUntil = false, bool withAnimation = true}) {
    Navigator.push(
      Get.context!,
      ConcentricPageRoute(
        builder: (ctx) {
          return const GreetingPage();
        },
      ),
    );
  }*/

  static void openAuthPage({bool goBackToPage = true, bool removeUntil = false}) {
    _route(
      page: AuthentificationPage(goBackToPage: goBackToPage),
      withAnimation: true,
      removeUntil: removeUntil,
    );
  }

  static void openCategoryPickerPage({required Function onSave, required Set<int> selectedIds}) {
    _route(
      page: CategoryPage(onSave: onSave, selectedIds: selectedIds),
      withAnimation: true,
    );
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
