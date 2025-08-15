import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';
import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/pages/shopping_cart_page/widgets/shopping_cart_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/product_image_widget.dart';
import 'package:presentation/util/widgets/select_checkbox_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../util/widgets/product_input_quantity_widget.dart';
import '../delivery_address_page/delivery_address_controller.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  CartController get cartController => Get.find();
  ContactInformationController get contactController => Get.find();
  DeliveryAddressController get deliveryController => Get.find();
  @override
  void initState() {
    super.initState();
    Get.put(CartController());
    Get.put(ContactInformationController(), permanent: true);
    Get.put(DeliveryAddressController(), permanent: true);
    deliveryController.onInit();
    deliveryController.toDeliveryAddressViewModel();
    contactController.initAllItems();
    contactController.toUserViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppTexts.shoppingCart,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      body: Column(
        children: [
          if (cartController.cartItems.isEmpty) Container(color: Colors.lightGreen),
          Expanded(
            child: Obx(
              () => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        SelectCheckboxWidget(
                          tristate: false,
                          selected: item.isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              item.isSelected = value;
                            });
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          child: ProductImageWidget(
                            height: 80,
                            width: 80,
                            imageUrl: item.imageUrl != null && item.imageUrl!.isNotEmpty ? item.imageUrl : null,
                          ),
                        ),
                        Expanded(child: ShoppingCartTitleWidget(item: item)),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ProductInputQuantityWidget(
                              initialValue: item.quantity,
                              onChanged: (val) {
                                item.quantity = val;
                                cartController.cartItems.refresh();
                              },
                              maxValue: item.stock,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBarWidget(
        item: dummyProduct,
        title: AppTexts.checkout,
        showIcon: false,
        router: () {
          AppRouter.openCheckoutPage(items: cartController.selectedItems);
        },
      ),
    );
  }
}
