import 'package:presentation/pages/shopping_cart_page/widgets/shopping_cart_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/util/widgets/product_image_widget.dart';
import 'package:presentation/util/widgets/select_checkbox_widget.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_pop_up.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../util/widgets/product_input_quantity_widget.dart';
import 'cart_controller.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  CartController get cartController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(CartController());
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
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return EmptyWidget();
        } else {
          return ListView.builder(
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
                      borderRadius: BorderRadius.circular(16),
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
                        Obx(
                          () => ProductInputQuantityWidget(
                            key: ValueKey(
                              '${cartController.cartItems[index].id}_${cartController.cartItems[index].quantity}',
                            ),
                            minValue: 1,
                            initialValue: cartController.cartItems[index].quantity,
                            onChanged: (val) {
                              if (val == 0) {
                                AppPopUp.showConfirmationDialog(
                                  context: context,
                                  title: AppTexts.removeItem,
                                  content: AppTexts.removeItemQuestion,
                                  onSave: () {
                                    cartController.removeItem(index);
                                  },
                                  onCancel: () {
                                    cartController.cartItems.refresh();
                                  },
                                );
                              } else {
                                cartController.updateQuantity(index, val, context);
                              }
                            },
                            maxValue: cartController.cartItems[index].stock,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),

      bottomNavigationBar: Obx(
        () => BottomNavigationBarWidget(
          title: cartController.cartItems.isEmpty || cartController.selectedItems.isEmpty
              ? AppTexts.continueShopping
              : AppTexts.checkout,
          showIcon: cartController.cartItems.isEmpty,
          onTap: () {
            cartController.cartItems.isEmpty || cartController.selectedItems.isEmpty
                ? AppRouter.openHomePage()
                : AppRouter.openCheckoutPage(items: cartController.selectedItems);
          },
        ),
      ),
    );
  }
}
