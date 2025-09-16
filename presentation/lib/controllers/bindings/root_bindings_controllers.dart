import 'package:get/get.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import '../main_app_controller.dart';

class RootBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
  }
}
