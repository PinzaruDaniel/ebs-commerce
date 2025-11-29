import 'dart:async';
import 'dart:developer' as developer;

import 'package:common/constants/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/routing/app_pop_up.dart';

class InternetController extends GetxController {
  final RxList<ConnectivityResult> connectionStatus = <ConnectivityResult>[ConnectivityResult.none].obs;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

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
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primary,
          duration: Duration(seconds: 2),
          content: const Text('This is a floating SnackBar!'),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 6,
          persist: false,
        ),
      );


      //TODO:del decomentat
      consoleLog('no internet found');
    }
  }
}
