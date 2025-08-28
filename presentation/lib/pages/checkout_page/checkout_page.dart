import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/widgets/checkout_product_view_widget.dart';
import 'package:presentation/pages/checkout_page/widgets/order_summary_widget.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/cart_products_view_model.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartViewModel> items;

  const CheckoutPage({super.key, required this.items});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
    deliveryAddressController.onInit();
    deliveryAddressController.toDeliveryAddressViewModel();
    checkoutController.initAllItems();
    contactInformationController.initAllItems();
    contactInformationController.toUserViewModel();
  }

  @override
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
                    return CheckoutInfoContainerWidget(item: item);
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
      bottomNavigationBar: Obx(
        () => BottomNavigationBarWidget(
          titleDialog: AppTexts.oops,
          contentDialog: AppTexts.enterAllData,
          title: checkoutController.selectedPaymentMethod.isNotEmpty && !checkoutController.hasIncompleteUserInfo()
              ? AppTexts.createOrder
              : AppTexts.enterAllData,
          addToCart: checkoutController.selectedPaymentMethod.isNotEmpty && !checkoutController.hasIncompleteUserInfo(),
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
        ),
      ),
    );
  }
}
