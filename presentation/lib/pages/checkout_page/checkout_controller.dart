// ignore_for_file: invalid_use_of_protected_member

import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/use_cases/delivery_address/get_delivery_address_use_case.dart';
import 'package:domain/modules/user_information/use_cases/delivery_address/set_delivery_address_use_case.dart';
import 'package:domain/modules/user_information/use_cases/payment_method/get_payment_method_use_case.dart';
import 'package:domain/modules/user_information/use_cases/payment_method/set_payment_method_use_case.dart';
import 'package:domain/modules/user_information/use_cases/user/get_user_use_case.dart';
import 'package:domain/modules/user_information/use_cases/user/set_user_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/checkout_page/widgets/order_summary_widget.dart';
import 'package:presentation/util/enum/map_enums.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/enum/enums.dart';
import '../../util/resources/app_texts.dart';
import '../../view/cart_products_view_model.dart';
import '../../view/payment_method_view_model.dart';
import '../../view/pickup_location_view_model.dart';

class CheckoutController extends GetxController {
  final SetUserUseCase setUserUseCase = GetIt.instance<SetUserUseCase>();
  final GetUserUseCase getUserUseCase = GetIt.instance<GetUserUseCase>();

  final SetDeliveryAddressUseCase setDeliveryAddressUseCase = GetIt.instance<SetDeliveryAddressUseCase>();
  final GetDeliveryAddressUseCase getDeliveryAddressUseCase = GetIt.instance<GetDeliveryAddressUseCase>();

  final SetPaymentMethodUseCase setPaymentMethodUseCase = GetIt.instance<SetPaymentMethodUseCase>();
  final GetPaymentMethodUseCase getPaymentMethodUseCase = GetIt.instance<GetPaymentMethodUseCase>();

  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();
  Rxn<DeliveryAddressViewModel> deliveryModel = Rxn<DeliveryAddressViewModel>();
  Rxn<PaymentMethodViewModel> selectedPaymentMethod = Rxn<PaymentMethodViewModel>();
  RxString voucherCode = RxString('');
  RxList<CartViewModel> productItems = RxList([]);
  final OrderSummaryViewModel orderSummary = OrderSummaryViewModel();

  void someInitMethod() async {
    final user = UserEntity(
      id: 0,
      name: 'Alice',
      surname: 'Smith',
      number: '5551234',
      dialCode: '+40',
      email: 'alice@example.com',
    );

    await setUserUseCase(SetUserParams(user: user));

    final retrievedUser = await getUserUseCase();

    print(' Cached user: ${retrievedUser.name}, ${retrievedUser.email}');

    final deliveryAddress = DeliveryAddressEntity(
      id: 0,
      deliveryType: 'delivery',
      comments: 'comments',
      pickupLocation: 'pickupLocation',
      country: 'country',
      region: 'region',
      city: 'city',
      postalCode: 'postalCode',
      address: 'address',
    );
    await setDeliveryAddressUseCase(SetDeliveryAddressParams(deliveryAddress: deliveryAddress));

    final retrievedDelivery = await getDeliveryAddressUseCase();
    print(
      'cached delivery address: ${retrievedDelivery.city},${retrievedDelivery.postalCode}, ${retrievedDelivery.region},  ',
    );

    final paymentMethod = PaymentMethodEntity(id: 0, key: 'cash', titleKey: AppTexts.cashPaymentMethod);
    await setPaymentMethodUseCase(SetPaymentMethodParams(paymentMethod: paymentMethod));

    final retrievedPayment = await getPaymentMethodUseCase();
    print('Cached payment method: ${retrievedPayment.titleKey}  ${retrievedPayment.key}');
  }

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
    updateOrderSummary(calculateSubtotal());

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
        placeholder: AppTexts.chooseDeliveryAddress,
        titleKey: deliveryModel.value?.deliveryType ?? '',
        infoItems: buildDeliveryInfo(deliveryModel.value),
      ),

      HeaderTitleViewModel(title: AppTexts.paymentMethod),
      CheckoutInfoContainerViewModel(
        keyId: CheckoutWidgetsType.paymentMethod,
        placeholder: AppTexts.choosePaymentMethod,
        titleKey: selectedPaymentMethod.value?.titleKey,
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
      orderSummary,
    ];

    allItems.refresh();
  }

  double calculateSubtotal() {
    return productItems.value.fold(0.0, (sum, item) => sum + item.totalPrice);
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
    var isPickUpType = model?.deliveryType == DeliveryType.pickup.label;
    if (isPickUpType) {
      return {'${AppTexts.pickupLocation}: ${model?.pickupLocation ?? pickupLocations.first.address}': ''};
    } else if (!isPickUpType && model?.deliveryType != null) {
      return {
        '${AppTexts.country}: ${model?.country ?? ''}': '',
        '${AppTexts.region}: ${model?.region ?? ''}': '',
        '${AppTexts.city}: ${model?.city ?? ''}': '',
        '${AppTexts.postalCode}: ${model?.postalCode ?? ''}': '',
        '${AppTexts.street}: ${model?.address ?? ''}': '',
      };
    }
    return null;
  }

  Map<String, String> buildUserInfo(UserViewModel? model) {
    final info = <String, String>{};
    if (model != null) {
      if ((model.number.isNotEmpty) && (model.dialCode.isNotEmpty)) {
        info['${model.dialCode} ${model.number}'] = '';
      } else if (model.number.isNotEmpty) {
        info[model.number] = '';
      }
      if (model.email.isNotEmpty) {
        info[model.email] = '';
      }
    }
    return info;
  }

  void updateOrderSummary(double subtotal) {
    orderSummary.subtotal.value = subtotal;

    orderSummary.shippingFee.value =
        (deliveryModel.value?.deliveryType == DeliveryType.dhl.label ||
            deliveryModel.value?.deliveryType == DeliveryType.fanCourier.label)
        ? 5.0
        : 0.0;

    orderSummary.voucherDiscount.value = voucherCode.value.isNotEmpty ? 10.0 : 0.0;

    orderSummary.total.value =
        subtotal + orderSummary.shippingFee.value + orderSummary.adminFee.value - orderSummary.voucherDiscount.value;
  }
}
