import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:common/constants/constant_lists_string.dart';
import 'package:common/constants/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/checkout_controller.dart';
import 'package:presentation/pages/checkout_page/widgets/checkout_product_view_widget.dart';
import 'package:presentation/pages/checkout_page/widgets/order_summary_widget.dart';
import 'package:presentation/util/enum/enums.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/cart_products_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/user_view_model.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_pop_up.dart';
import '../../util/routing/app_router.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartViewModel> items;

  const CheckoutPage({super.key, required this.items});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  CheckoutController get checkoutController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(CheckoutController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkoutController.initProductItems(widget.items);
      checkoutController.initAllItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: AppTexts.checkout,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: checkoutController.allItems.map((item) {
                  if (item is HeaderTitleViewModel) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: HeaderTitleWidget(itemViewModel: item),
                    );
                  }
                  if (item is CartViewModel) {
                    return CheckoutProductViewWidget(item: item);
                  }
                  if (item is CheckoutInfoContainerViewModel) {
                    return CheckoutInfoContainerWidget(
                      item: item,
                      onTap: () {
                        if (item.keyId == CheckoutWidgetsType.userContactInfo) {
                          AppRouter.openContactInformationPage(
                            userViewModel: currentUserController.userVM.value,
                            onSave: (UserViewModel? userVM) {
                              consoleLog('User image: ${userVM?.imageUrl}');
                              checkoutController.updateCheckoutInfoItem(
                                keyId: CheckoutWidgetsType.userContactInfo,
                                titleKey: '${userVM?.name} ${userVM?.surname}',
                                infoItems: checkoutController.buildUserInfo(userVM),
                              );
                              checkoutController.setUserInfo();
                            },
                          );
                        } else if (item.keyId == CheckoutWidgetsType.deliveryAddressInfo) {
                          AppRouter.openDeliveryAddressPage(
                            deliveryAddressVM: checkoutController.deliveryModel.value,
                            onSave: (DeliveryAddressViewModel? deliveryVM) {
                              checkoutController.deliveryModel.value = deliveryVM;
                              checkoutController.updateCheckoutInfoItem(
                                keyId: CheckoutWidgetsType.deliveryAddressInfo,
                                titleKey: deliveryVM?.deliveryType ?? '',
                                infoItems: checkoutController.buildDeliveryInfo(deliveryVM),
                              );
                              checkoutController.updateOrderSummary(checkoutController.calculateSubtotal());
                              checkoutController.setDeliveryInfo();
                            },
                          );
                        } else if (item.keyId == CheckoutWidgetsType.paymentMethod) {
                          AppPopUp.paymentMethod(
                            initialMethod: checkoutController.selectedPaymentMethod.value,
                            onSelected: (value) {
                              checkoutController.selectedPaymentMethod.value = value;
                              checkoutController.updateCheckoutInfoItem(
                                keyId: CheckoutWidgetsType.paymentMethod,
                                titleKey: value.titleKey,
                              );
                              Get.back();
                              checkoutController.setPaymentInfo();
                            },
                          );
                        } else if (item.keyId == CheckoutWidgetsType.voucherCode) {
                          AppPopUp.voucherCode(
                            initialValue: checkoutController.voucherCode.value,
                            onSubmit: (enteredCode) {
                              final isValid = promoCodes.contains(enteredCode);
                              if (isValid) {
                                checkoutController.voucherCode.value = enteredCode;
                                checkoutController.updateCheckoutInfoItem(
                                  keyId: CheckoutWidgetsType.voucherCode,
                                  titleKey: enteredCode,
                                );
                                checkoutController.updateOrderSummary(checkoutController.calculateSubtotal());
                                Get.back();
                              }
                              AppPopUp.showFailureSnackBar(
                                title: isValid ? AppTexts.success : AppTexts.invalidCode,
                                fallbackMessage: isValid ? AppTexts.promoValid : AppTexts.promoNotValid,
                                isError: !isValid,
                              );
                            },
                          );
                        }
                      },
                    );
                  }
                  if (item is OrderSummaryViewModel) {
                    return OrderSummaryWidget(orderSummary: item);
                  }
                  return SizedBox();
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        final hasSelectedPayment = checkoutController.selectedPaymentMethod.value != null;
        final hasCompleteInfo = !checkoutController.hasIncompleteUserInfo();
        final hasDeliveryAddress = checkoutController.deliveryModel.value != null;
        final hasDoneAll = hasSelectedPayment && hasCompleteInfo && hasDeliveryAddress;
        return BottomNavigationBarWidget(
          buttonColor: hasDoneAll ? AppColors.primary : Colors.grey.shade300,
          textColor: hasDoneAll ? Colors.white : Colors.black,

          title: hasDoneAll ? AppTexts.createOrder : AppTexts.enterAllData,
          onTap: () {
            if (hasDoneAll) {
              AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                title: AppTexts.orderSuccess,
                btnOkText: AppTexts.ok,
                btnOkOnPress: () {
                  mainAppController.addOrderedProducts(
                    items: checkoutController.productItems,
                    idUser: currentUserController.userVM.value?.idUser ?? 0,
                  );
                  mainAppController.cartItems.clear();
                },
                btnOkColor: AppColors.primary,
              ).show();
            } else {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                headerAnimationLoop: false,
                animType: AnimType.scale,
                title: AppTexts.oops,
                desc: AppTexts.enterAllData,
                btnOkOnPress: () {},
              ).show();
            }
          },
          showIcon: false,
        );
      }),
    );
  }
}
