import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/checkout_controller.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_controller.dart';
import 'package:presentation/pages/filtered_page/filter_controller.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import '../../pages/category_page/category_controller.dart';
import '../main_app_controller.dart';

class RootBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
   // await Get.putAsync<CheckoutController>(() async => CheckoutController(), permanent: true);
    await Get.putAsync<CartController>(() async => CartController());
    //await Get.putAsync<DeliveryAddressController>(() async => DeliveryAddressController());
  /*  await Get.putAsync<CategoryController>(() async => CategoryController());
    await Get.putAsync<ContactInformationController>(() async => ContactInformationController());
    await Get.putAsync<FilterController>(() async => FilterController());*/
  }
}
