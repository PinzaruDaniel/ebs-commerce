import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:common/constants/promocode_constants.dart';
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
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_pop_up.dart';
import '../../util/routing/app_router.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../util/widgets/failure_snack_bar_widget.dart';

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
          onPressed: () => Navigator.pop(context),
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
                            onSave: (UserViewModel? userVM) {
                              if (userVM == null) {
                                print('userVM is null');
                                return;
                              }
                              checkoutController.userModel.value = userVM;
                              print('Name: ${userVM.name}');
                              print('Surname: ${userVM.surname}');
                              print('Number: ${userVM.number}');
                              print('Email: ${userVM.email}');
                              final updatedInfo = {
                                if (userVM.number.isNotEmpty) userVM.number: '',
                                if (userVM.email.isNotEmpty) userVM.email: '',
                              };

                              checkoutController.updateCheckoutInfoItem(
                                keyId: CheckoutWidgetsType.userContactInfo,
                                titleKey: '${userVM.name} ${userVM.surname}',
                                infoItems: updatedInfo,
                              );
                            },
                          );
                        } else if (item.keyId == CheckoutWidgetsType.deliveryAddressInfo) {
                          AppRouter.openDeliveryAddressPage(
                            onSave: (DeliveryAddressViewModel? deliveryVM) {
                              checkoutController.updateCheckoutInfoItem(
                                keyId: CheckoutWidgetsType.deliveryAddressInfo,
                                titleKey: '${deliveryVM?.deliveryType ?? ''}',
                                infoItems: checkoutController.buildDeliveryInfo(deliveryVM),
                              );
                            },
                          );
                        } else if (item.keyId == CheckoutWidgetsType.paymentMethod) {
                          AppPopUp.paymentMethod(
                            selectedMethod: '',
                            onSelected: (value) {
                              checkoutController.selectedPaymentMethod.value = value;
                              checkoutController.initAllItems();
                              Navigator.pop(Get.context!);
                            },
                          );
                        } else if (item.keyId == CheckoutWidgetsType.voucherCode) {
                          AppPopUp.voucherCode(
                            initialValue: checkoutController.voucherCode.value,
                            onSubmit: (enteredCode) {
                              final isValid = promoCodes.contains(enteredCode);
                              if (isValid) {
                                checkoutController.voucherCode.value = enteredCode;
                                checkoutController.initAllItems();
                                Get.back();
                              }
                              Future.delayed(Duration(milliseconds: 200), () {
                                showFailureSnackBar(
                                  title: isValid ? AppTexts.success : AppTexts.invalidCode,
                                  fallbackMessage: isValid ? AppTexts.promoValid : AppTexts.promoNotValid,
                                  isError: !isValid,
                                );
                              });
                            },
                          );
                        }
                      },
                      onRemoveTap: () {},
                    );
                  }
                  if (item is OrderSummaryViewModel) {
                    return OrderSummaryWidget();
                  }
                  return SizedBox();
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        final hasSelectedPayment = checkoutController.selectedPaymentMethod.value.isNotEmpty;
        final hasCompleteInfo = !checkoutController.hasIncompleteUserInfo();

        return BottomNavigationBarWidget(
          titleDialog: AppTexts.oops,
          contentDialog: AppTexts.enterAllData,
          title: hasSelectedPayment && hasCompleteInfo ? AppTexts.createOrder : AppTexts.enterAllData,
          addToCart: hasSelectedPayment && hasCompleteInfo,
          onTap: () {
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              title: AppTexts.orderSuccess,
              btnOkText: AppTexts.ok,
              btnOkOnPress: () {},
              btnOkColor: AppColors.primary,
            ).show();
          },
          showIcon: false,
        );
      }),
    );
  }
}
