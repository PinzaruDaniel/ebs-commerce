// ignore_for_file: invalid_use_of_protected_member

import 'package:common/constants/logger.dart';
import 'package:domain/modules/products/use_cases/set_orders_use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import '../view/cart_products_view_model.dart';
import '../view/order_view_model.dart';

class MainAppController extends GetxController {
  SetOrdersUseCase setOrdersUseCase = GetIt.instance<SetOrdersUseCase>();
  RxList<String> pendingIds = RxList([]);
  RxList<CartViewModel> cartItems = RxList([]);
  RxList<OrderViewModel> orders = RxList([]);

  void addToCart(CartViewModel item) {
    final index = cartItems.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      if (cartItems[index].quantity == item.stock) {
        return;
      } else {
        cartItems[index].quantity++;
      }
      consoleLog('addToCart quantity: ${cartItems[index].quantity} ');
    } else {
      cartItems.add(item);
      //consoleLog('addToCart add quantity: ${cartItems[index].quantity} ');
    }
  }

  void changeLanguage(Locale locale, BuildContext context) {
    context.setLocale(locale);
    Get.updateLocale(locale);
  }

  void addOrderedProducts({required List<CartViewModel> items, required int idUser}) {
    final orderedProducts = items.map((e) => e.toOrderedProducts).toList();
    final newOrderId = orders.isEmpty ? 1 : orders.last.idOrder + 1;

    final newOrder = OrderViewModel(
      idUser: idUser,
      idOrder: newOrderId,
      dateTime: DateTime.now(),
      products: orderedProducts,
    );

    orders.add(newOrder);
    consoleLog('added newOrder: ${newOrder.dateTime}  ${newOrder.products.length}  ');
    setOrdersUseCase.call(SetOrdersParams(idUser: idUser, orders: orders.value.map((e) => e.toEntity).toList()));
  }

  void addPendingIds(List<String> pendingIds) {
    this.pendingIds.value.addAll(pendingIds);
    this.pendingIds.refresh();
    consoleLog('pendingIds ${this.pendingIds.value[0]}');
  }

  void removePendingIds(List<String> pendingIds) {
    this.pendingIds.value.removeWhere((item) => pendingIds.contains(item));
    this.pendingIds.refresh();
  }
}
