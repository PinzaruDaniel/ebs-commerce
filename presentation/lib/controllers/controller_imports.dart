import 'package:get/get.dart';
import 'package:presentation/pages/category_page/category_controller.dart';
import 'package:presentation/pages/checkout_page/checkout_controller.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_controller.dart';
import 'package:presentation/pages/filtered_page/filter_controller.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';

import 'main_app_controller.dart';

final MainAppController mainAppController = Get.find();
final CheckoutController checkoutController = Get.find();
final CartController cartController =Get.find();
final DeliveryAddressController deliveryAddressController = Get.find();
final ContactInformationController contactInformationController=Get.find();
final CategoryController categoryController = Get.find();
final FilterController filterController = Get.find();
