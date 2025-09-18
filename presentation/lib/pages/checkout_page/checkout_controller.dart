import 'package:common/constants/constant_lists_string.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/widgets/order_summary_widget.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';
import '../../util/enum/enums.dart';
import '../../util/resources/app_texts.dart';
import '../../view/cart_products_view_model.dart';

class CheckoutController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();
  Rxn<DeliveryAddressViewModel> deliveryModel = Rxn<DeliveryAddressViewModel>();
  RxString selectedPaymentMethod = ''.obs;
  RxString voucherCode = RxString('');
  RxList<CartViewModel> productItems = RxList([]);

  void initProductItems(List<CartViewModel> productItems) {
    this.productItems.value = productItems;
    this.productItems.refresh();
    allItems.refresh();
  }
  bool hasIncompleteUserInfo() {
    final user = userModel.value;
    if (user == null) return true;
    return user.surname.isEmpty || user.number.isEmpty || user.name.isEmpty || user.email.isEmpty;
  }

  void initAllItems() {
    allItems.value = [
      HeaderTitleViewModel(title: AppTexts.orderSummary),
      ...productItems.value,

      HeaderTitleViewModel(title: AppTexts.contactInformation),
      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.userContactInfo,
        titleKey: '${userModel.value?.name ?? ''} ${userModel.value?.surname ?? ''}',
        infoItems: buildUserInfo(userModel.value),
      ),

      HeaderTitleViewModel(title: AppTexts.deliveryAddress),
      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.deliveryAddressInfo,
        placeholder: 'Choose your Delivery Address',
        titleKey: '${deliveryModel.value?.deliveryType ?? ''}',
        infoItems: buildDeliveryInfo(deliveryModel.value),
      ),

      HeaderTitleViewModel(title: AppTexts.paymentMethod),
      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.paymentMethod,
        placeholder: AppTexts.choosePaymentMethod,
        titleKey: selectedPaymentMethod.value,
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
    return productItems.value.fold(0.0, (sum, item) {
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

  Map<String, String>? buildDeliveryInfo(DeliveryAddressViewModel? model) {
    var isPickUpType = model?.deliveryType == DeliveryType.pickup.value;
    if (isPickUpType) {
      return {'Pickup Location: ${model?.pickupLocation ?? pickupLocations.first}': ''};
    }
    else if (!isPickUpType && model?.deliveryType!=null){
      return
        {'Country: ${model?.country ?? ''}': '',
          'Region: ${model?.region ?? ''}': '',
          'City: ${model?.city ?? ''}': '',
          'Postal Code: ${model?.postalCode ?? ''}': '',
          'Street: ${model?.address ?? ''}': '',};
    }
    return null;
  }

  Map<String, String> buildUserInfo(UserViewModel? model) {
    final info = <String, String>{};
    if (model?.number.isNotEmpty ?? false) info[model!.number] = '';
    if (model?.email.isNotEmpty ?? false) info[model!.email] = '';
    return info;
  }

  OrderSummaryViewModel _buildOrderSummary(double subtotal) {
    final summary = OrderSummaryViewModel();
    summary.subtotal.value = subtotal;
    summary.shippingFee.value =
        (deliveryModel.value?.deliveryType == DeliveryType.dhl ||
            deliveryModel.value?.deliveryType == DeliveryType.fanCourier)
        ? 5.0
        : 0.0;
    summary.voucherDiscount.value = voucherCode.value.isNotEmpty ? 10.0 : 0.0;
    summary.total.value = subtotal + summary.shippingFee.value + summary.adminFee - summary.voucherDiscount.value;
    return summary;
  }
}
