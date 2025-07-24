import 'package:presentation/controllers/main_app_controller.dart';
import 'package:presentation/view/cart_products_view_model.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = Get.find<MainAppController>().cartItems;

}
