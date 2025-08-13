import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/widgets/checkout_contact_information_widget.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/resources/app_texts.dart';

class CheckoutController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user=Rxn<UserViewModel>();
  CartController get cartController => Get.find();

  void initAllItems() {
    allItems.value = [

      HeaderTitleViewModel(title: AppTexts.orderSummary, showDivider: true),
      ...cartController.selectedItems,
      HeaderTitleViewModel(title: AppTexts.contactInformation, showDivider: true),
      CheckoutContactInformationVieModel(),
      HeaderTitleViewModel(title: AppTexts.deliveryAddress, showDivider: true),
      HeaderTitleViewModel(title: AppTexts.paymentMethod, showDivider: true),
    ];
    allItems.refresh();
  }
}
