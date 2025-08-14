import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/checkout_page/checkout_controller.dart';
import 'package:presentation/pages/checkout_page/widgets/checkout_contact_information_widget.dart';
import 'package:presentation/pages/checkout_page/widgets/checkout_product_view_widget.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/checkout_info_container_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/cart_products_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../contact_information_page/contact_information_controller.dart';
import '../shopping_cart_page/cart_controller.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartViewModel> items;
  final UserViewModel? user;

  const CheckoutPage({super.key, required this.items, this.user});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  CheckoutController get checkController => Get.find();
  ContactInformationController get contactController => Get.find();

  CartController get cartController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(CheckoutController());
    Get.put(ContactInformationController());
    checkController.initAllItems();
    contactController.initAllItems();
    contactController.toUserViewModel();
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemCount: checkController.allItems.length,
                  itemBuilder: (context, index) {
                    var item = checkController.allItems[index];
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

                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
