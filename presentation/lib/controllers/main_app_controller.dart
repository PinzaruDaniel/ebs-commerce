import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../util/widgets/failure_snack_bar_widget.dart';
import '../view/cart_products_view_model.dart';

class MainAppController extends GetxController {
  RxList<CartViewModel> cartItems = RxList([]);
  final Connectivity _connectivity = Connectivity();
  final RxList<ConnectivityResult> connectionStatus = <ConnectivityResult>[ConnectivityResult.none].obs;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  Future<void> initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      await _updateConnectionStatus(result);
    } catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
    }
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    connectionStatus.assignAll(result);
    if (result.contains(ConnectivityResult.none)) {
      showFailureSnackBar(
        fallbackMessage: 'No internet connection',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

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
