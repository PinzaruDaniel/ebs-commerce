import 'dart:async';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/products/use_cases/get_orders_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/order_view_model.dart';

class OrdersController extends GetxController {
  final GetOrdersUseCase getOrdersUseCase = GetIt.instance<GetOrdersUseCase>();
  final RxList<OrderViewModel> orders = RxList([]);
  final RxBool isLoading = true.obs;
  StreamSubscription? _streamSubscription;

  void initController() {
    getOrders();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  Future<void> getOrders() async {
    try {
      _streamSubscription?.cancel();

      _streamSubscription = getOrdersUseCase.call().distinct().listen(
            (list) {
          orders.value = list.map((e) {
            consoleLog('got newOrder: ${e.dateTime} ${e.products.length}');
            return e.toModel;
          }).toList();

          isLoading.value = false;
        },
        onError: (error) {
          consoleLog('Error loading orders: $error');
          isLoading.value = false;
        },
        onDone: () {
          isLoading.value = false;
        },
      );
    } catch (e) {
      consoleLog('Exception in getOrders: $e');
      isLoading.value = false;
    }
  }
}