import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/widgets/order_summary_widget.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../controllers/controller_imports.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_router.dart';

class CheckoutController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();
  Rxn<DeliveryAddressViewModel> deliveryModel = Rxn<DeliveryAddressViewModel>();
  RxString selectedPaymentMethod = RxString('');
  RxString voucherCode = RxString('');

  CartController get cartController => Get.find();

  void initAllItems() {
    userModel.value = contactInformationController.toUserViewModel();
    deliveryModel.value = deliveryAddressController
        .toDeliveryAddressViewModel();
    final isPickup = deliveryModel.value?.deliveryType == 'Ridicare la sediu';
    final infoItems = <String, String>{};

    final number = userModel.value?.number;
    if (number != null && number.isNotEmpty) {
      infoItems[number] = '';
    }

    final email = userModel.value?.email;
    if (email != null && email.isNotEmpty) {
      infoItems[email] = '';
    }

    final deliveryInfoItems = isPickup
        ? {'Pickup Location: ${deliveryModel.value?.pickupLocation ?? ''}': ''}
        : {
            'Country: ${deliveryModel.value?.country ?? ''}': '',
            'Region: ${deliveryModel.value?.region ?? ''}': '',
            'City: ${deliveryModel.value?.city ?? ''}': '',
            'Postal Code: ${deliveryModel.value?.postalCode ?? ''}': '',
            'Street: ${deliveryModel.value?.address ?? ''}': '',
          };

    final orderSummary = OrderSummaryViewModel();
    orderSummary.subtotal.value = cartController.selectedItems.fold(0.0, (
      sum,
      item,
    ) {
      final price = item.price;
      return sum +
          (price is String
              ? double.tryParse(price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0
              : price as num? ?? 0.0);
    });
    orderSummary.shippingFee.value =
        (deliveryModel.value?.deliveryType == 'DHL' ||
            deliveryModel.value?.deliveryType == 'Fan courier')
        ? 5.0
        : 0.0;
    orderSummary.adminFee.value = 2.0;
    orderSummary.voucherDiscount.value = voucherCode.value.isNotEmpty
        ? 10.0
        : 0.0;
    orderSummary.total.value =
        orderSummary.subtotal.value +
        orderSummary.shippingFee.value +
        orderSummary.adminFee.value -
        orderSummary.voucherDiscount.value;

    allItems.value = [
      HeaderTitleViewModel(title: AppTexts.orderSummary),
      ...cartController.selectedItems,
      HeaderTitleViewModel(title: AppTexts.contactInformation),
      CheckoutInfoContainerViewModel(
        titleKey:
            '${userModel.value?.name ?? ''} ${userModel.value?.surname ?? ''}',
        infoItems: infoItems,
        onTap: () {
          AppRouter.openContactInformationPage();
        },
      ),
      HeaderTitleViewModel(title: AppTexts.deliveryAddress),
      CheckoutInfoContainerViewModel(
        titleKey: deliveryModel.value?.deliveryType ?? '',
        infoItems: deliveryInfoItems,
        onTap: () {
          AppRouter.openDeliveryAddressPage();
        },
      ),
      HeaderTitleViewModel(title: AppTexts.paymentMethod),
      CheckoutInfoContainerViewModel(
        titleKey: selectedPaymentMethod.value,
        onTap: () {
          AppPopUp.paymentMethod(
            selectedMethod: selectedPaymentMethod.value.obs,
            onSelected: (value) {
              selectedPaymentMethod.value = value;
            },
          );
        },
        infoItems: {},
      ),

      CheckoutInfoContainerViewModel(
        isPromoValid: true,
        showRemoveButton: voucherCode.value.isEmpty ? false : true,
        titleKey: voucherCode.value,
        onTap: () {
          AppPopUp.voucherCode(voucherCode: voucherCode);
        },
        onRemoveTap: () {
          voucherCode.value = '';
          checkoutController.initAllItems();
        },
        infoItems: {},
      ),
    ];

    orderSummary;
    allItems.refresh();
  }
}
