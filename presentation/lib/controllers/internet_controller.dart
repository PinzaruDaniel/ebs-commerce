import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../util/widgets/failure_snack_bar_widget.dart';

class InternetController extends GetxController{
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
      showFailureSnackBar(
        fallbackMessage: 'No internet connection',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

}