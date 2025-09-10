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
import '../../util/enum/delivery_type.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_router.dart';
import '../../util/widgets/text_field_widget.dart';
import '../../view/promo_code_view_model.dart';

class CheckoutController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();
  Rxn<DeliveryAddressViewModel> deliveryModel = Rxn<DeliveryAddressViewModel>();
  RxString selectedPaymentMethod = RxString('');
  RxString voucherCode = RxString('');

  CartController get cartController => Get.find();

  bool hasIncompleteUserInfo() {
    final user = contactInformationController.toUserViewModel();
    if (user == null) return true;
    userModel.value = user;
    return user.surname.isEmpty || user.number.isEmpty || user.name.isEmpty || user.email.isEmpty;
  }

  void initAllItems() {
    userModel.value = contactInformationController.toUserViewModel();
    deliveryModel.value = deliveryAddressController.toDeliveryAddressViewModel();

    allItems.value = [
      HeaderTitleViewModel(title: AppTexts.orderSummary),
      ...cartController.selectedItems,

      HeaderTitleViewModel(title: AppTexts.contactInformation),
      CheckoutInfoContainerViewModel(
        titleKey: '${userModel.value?.name ?? ''} ${userModel.value?.surname ?? ''}',
        infoItems: _buildUserInfo(userModel.value),
        onTap: AppRouter.openContactInformationPage,
      ),

      HeaderTitleViewModel(title: AppTexts.deliveryAddress),
      CheckoutInfoContainerViewModel(
        titleKey: deliveryModel.value?.deliveryType ??'',
        infoItems: _buildDeliveryInfo(deliveryModel.value),
        onTap: AppRouter.openDeliveryAddressPage,
      ),

      HeaderTitleViewModel(title: AppTexts.paymentMethod),
      CheckoutInfoContainerViewModel(
        placeholder: AppTexts.choosePaymentMethod,
        titleKey: selectedPaymentMethod.value,
        onTap: () {
          AppPopUp.paymentMethod(
            selectedMethod: selectedPaymentMethod.value.obs,
            onSelected: (value) {
              selectedPaymentMethod.value = value;
              initAllItems();
              Navigator.pop(Get.context!);
            },
          );
        },
        infoItems: {},
      ),

      CheckoutInfoContainerViewModel(
        placeholder: AppTexts.enterYourVoucher,
        isPromoValid: true,
        showRemoveButton: voucherCode.value.isNotEmpty,
        titleKey: voucherCode.value,
        onTap: _voucherTap,
        onRemoveTap: () {
          voucherCode.value = '';
          initAllItems();
        },
        infoItems: {},
      ),
      _buildOrderSummary(_calculateSubtotal()),
    ];

    allItems.refresh();
  }

  double _calculateSubtotal() {
    return cartController.selectedItems.fold(0.0, (sum, item) {
      final priceString = item.discountedPrice ?? item.price;
      final price = double.tryParse(priceString ?? '') ?? 0.0;
      return sum + price * item.quantity;
    });
  }

  Map<String, String> _buildDeliveryInfo(DeliveryAddressViewModel? model) {

    if (deliveryAddressController.fromLabel(model?.deliveryType ?? '') == DeliveryType.pickup) {
      print(model?.pickupLocation);
      return {'Pickup Location: ${model?.pickupLocation ?? ''}': ''};
    }
    return {
      'Country: ${model?.country ?? ''}': '',
      'Region: ${model?.region ?? ''}': '',
      'City: ${model?.city ?? ''}': '',
      'Postal Code: ${model?.postalCode ?? ''}': '',
      'Street: ${model?.address ?? ''}': '',
    };
  }

  Map<String, String> _buildUserInfo(UserViewModel? model) {
    final info = <String, String>{};
    if (model?.number.isNotEmpty ?? false) info[model!.number] = '';
    if (model?.email.isNotEmpty ?? false) info[model!.email] = '';
    return info;
  }

  OrderSummaryViewModel _buildOrderSummary(double subtotal) {
    final summary = OrderSummaryViewModel();
    summary.subtotal.value = subtotal;
    summary.shippingFee.value =
        (deliveryModel.value?.deliveryType == 'DHL' || deliveryModel.value?.deliveryType == 'Fan courier') ? 5.0 : 0.0;
    summary.voucherDiscount.value = voucherCode.value.isNotEmpty ? 10.0 : 0.0;
    summary.total.value = subtotal + summary.shippingFee.value + summary.adminFee - summary.voucherDiscount.value;
    return summary;
  }

  void _voucherTap() {
    final textViewModel = TextFieldViewModel(title: '', initialValue: voucherCode.value);
    AppPopUp.voucherCode(
      textViewModel: textViewModel,
      onTap: () {
        final promoCodeViewModel = PromoCodeViewModel();
        final validCodes = promoCodeViewModel.getMockPromoCodes();
        final enteredCode = textViewModel.placeholder.trim().toUpperCase();

        final isValid = validCodes.contains(enteredCode);
        if (isValid) {
          voucherCode.value = enteredCode;
          initAllItems();
          Get.back();
        }
        Future.delayed(Duration(milliseconds: 200), () {
          Get.snackbar(
            duration: Duration(milliseconds: 1750),
            isValid ? AppTexts.success : AppTexts.invalidCode,
            isValid ? AppTexts.promoValid : AppTexts.promoNotValid,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: isValid ? AppColors.primary : AppColors.red,
            colorText: Colors.white,
            forwardAnimationCurve: Curves.easeOutBack,
            reverseAnimationCurve: Curves.easeInOutBack,
            margin: EdgeInsets.symmetric(vertical: 50 , horizontal: 16),
          );
        });
      },
    );
  }
}
