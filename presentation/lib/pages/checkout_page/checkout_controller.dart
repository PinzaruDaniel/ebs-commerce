import 'package:get/get.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_controller.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/resources/app_texts.dart';
import '../../util/routing/app_router.dart';

class CheckoutController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();
  Rxn<DeliveryAddressViewModel> deliveryModel= Rxn<DeliveryAddressViewModel>();

  CartController get cartController => Get.find();

  ContactInformationController get contactController => Get.find();

  DeliveryAddressController get deliveryController => Get.find();


  void initAllItems() {
    final infoItems = <String, String>{};

    final number = userModel.value?.number;
    if (number != null && number.isNotEmpty) {
      infoItems[number] = '';
    }

    final email = userModel.value?.email;
    if (email != null && email.isNotEmpty) {
      infoItems[email] = '';
    }

    userModel.value = contactController.toUserViewModel();
    deliveryModel.value=deliveryController.toDeliveryAddressViewModel();
    allItems.value = [
      HeaderTitleViewModel(title: AppTexts.orderSummary),
      ...cartController.selectedItems,
      HeaderTitleViewModel(title: AppTexts.contactInformation),
      CheckoutInfoContainerViewModel(
        titleKey: '${userModel.value?.name ?? ''} ${userModel.value?.surname ?? ''} ',
        infoItems: infoItems,
        onTap: () {
          AppRouter.openContactInformationPage();
        },
      ),
      HeaderTitleViewModel(title: AppTexts.deliveryAddress),
      CheckoutInfoContainerViewModel(
          titleKey: deliveryModel.value?.deliveryType ?? '',
          infoItems: {
            'Country': deliveryModel.value?.country ?? '',
            'Region': deliveryModel.value?.region ?? '',
            'City': deliveryModel.value?.city ?? '',
            'PostalCode': deliveryModel.value?.postalCode ?? '',
            'Street': deliveryModel.value?.address
          },

        onTap: () {
          AppRouter.openDeliveryAddressPage();
        },
      ),

      HeaderTitleViewModel(title: AppTexts.paymentMethod),
    ];
    allItems.refresh();
  }
}
