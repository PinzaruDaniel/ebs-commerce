import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_pop_up.dart';

class InternetController extends GetxController {
  final RxList<ConnectivityResult> connectionStatus = <ConnectivityResult>[ConnectivityResult.none].obs;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  RxBool isConnected = RxBool(true);

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
      AppPopUp.showFailureSnackBar(fallbackMessage: AppTexts.noInternetConnection, snackPosition: SnackPosition.TOP);
      isConnected.value = false;
      isConnected.refresh();
    } else if (result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.mobile)) {
      isConnected.value = true;
      isConnected.refresh();
    }
  }
}
