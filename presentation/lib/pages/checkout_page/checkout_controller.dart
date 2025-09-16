import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/widgets/order_summary_widget.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';
import '../../util/enum/enums.dart';
import '../../util/resources/app_texts.dart';
import '../contact_information_page/contact_information_controller.dart';
import '../delivery_address_page/delivery_address_controller.dart';

class CheckoutController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();
  Rxn<DeliveryAddressViewModel> deliveryModel = Rxn<DeliveryAddressViewModel>();
  String selectedPaymentMethod = '';
  RxString voucherCode = RxString('');

  CartController get cartController => Get.find();
  ContactInformationController get contactInformationController=>Get.find();
  DeliveryAddressController get deliveryAddressController=>Get.find();

  bool hasIncompleteUserInfo() {
    final user = contactInformationController.toUserViewModel();
    if (user == null) return true;
    userModel.value = user;
    return user.surname.isEmpty || user.number.isEmpty || user.name.isEmpty || user.email.isEmpty;
  }

  void initAllItems() {
    deliveryModel.value = deliveryAddressController.toDeliveryAddressViewModel();

    allItems.value = [
      HeaderTitleViewModel(title: AppTexts.orderSummary),
      ...cartController.selectedItems,

      HeaderTitleViewModel(title: AppTexts.contactInformation),
      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.userContactInfo,
        titleKey: '${userModel.value?.name ?? ''} ${userModel.value?.surname ?? ''}',
        infoItems: _buildUserInfo(userModel.value),
      ),

      HeaderTitleViewModel(title: AppTexts.deliveryAddress),
      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.deliveryAddressInfo,
        titleKey: '${deliveryModel.value?.deliveryType ?? ''}',
        infoItems: _buildDeliveryInfo(deliveryModel.value),
      ),

      HeaderTitleViewModel(title: AppTexts.paymentMethod),
      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.paymentMethod,
        placeholder: AppTexts.choosePaymentMethod,
        titleKey: selectedPaymentMethod,
        infoItems: {},
      ),

      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.voucherCode,
        placeholder: AppTexts.enterYourVoucher,
        isPromoValid: true,
        showRemoveButton: voucherCode.value.isNotEmpty,
        titleKey: voucherCode.value,
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

  void updateCheckoutInfoItem({
    required CheckoutWidgetsType keyId,
    String? titleKey,
    String? placeholder,
    Map<String, String>? infoItems,
  }) {
    final index = allItems.indexWhere((item) => item is CheckoutInfoContainerViewModel && item.keyId == keyId);

    if (index == -1) return;

    final oldItem = allItems[index] as CheckoutInfoContainerViewModel;

    final newItem = CheckoutInfoContainerViewModel(
      keyId: oldItem.keyId,
      titleKey: titleKey ?? oldItem.titleKey,
      placeholder: placeholder ?? oldItem.placeholder,
      infoItems: infoItems ?? oldItem.infoItems,
      isPromoValid: oldItem.isPromoValid,
      showRemoveButton: oldItem.showRemoveButton,
    );

    allItems[index] = newItem;
    allItems.refresh();
  }

  Map<String, String> _buildDeliveryInfo(DeliveryAddressViewModel? model) {
    //deliveryTypeVM.value.options.firstWhere((e) => e.isSelected == true

    var isPickUpType = model?.deliveryType == DeliveryType.pickup;
    if (isPickUpType) {
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
}
