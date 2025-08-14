import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/widgets/checkout_contact_information_widget.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/resources/app_texts.dart';

class CheckoutController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();

  CartController get cartController => Get.find();

  void initAllItems() {
    allItems.value = [
      HeaderTitleViewModel(title: AppTexts.orderSummary),
      ...cartController.selectedItems,
      HeaderTitleViewModel(title: AppTexts.contactInformation),
      CheckoutContactInformationVieModel(
        titleKey: userModel.value?.name ,
        infoItems: {
          'Phone': userModel.value?.number ?? '',
          'Email': userModel.value?.email ?? '',
        },
      ),
      HeaderTitleViewModel(title: AppTexts.deliveryAddress),
      HeaderTitleViewModel(title: AppTexts.paymentMethod),
    ];
    allItems.refresh();
  }
}
