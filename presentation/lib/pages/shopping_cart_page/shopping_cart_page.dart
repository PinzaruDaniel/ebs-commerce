import 'package:presentation/pages/shopping_cart_page/widgets/shopping_cart_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/util/widgets/product_image_widget.dart';
import 'package:presentation/util/widgets/select_checkbox_widget.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_pop_up.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../util/widgets/product_input_quantity_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppTexts.shoppingCart,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context, true),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      body: Obx(() {
        if (mainAppController.cartItems.isEmpty) {
          return EmptyWidget();
        } else {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: mainAppController.cartItems.length,
            itemBuilder: (context, index) {
              final item = mainAppController.cartItems[index];
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
                              '${mainAppController.cartItems[index].id}_${mainAppController.cartItems[index].quantity}',
                            ),
                            minValue: 1,
                            initialValue: mainAppController.cartItems[index].quantity,
                            onChanged: (val) {
                              if (val == 0) {
                                AppPopUp.showConfirmationDialog(
                                  context: context,
                                  title: AppTexts.removeItem,
                                  content: AppTexts.removeItemQuestion,
                                  onSave: () {
                                    mainAppController.removeCartItem(index);
                                  },
                                  onCancel: () {
                                    mainAppController.cartItems.refresh();
                                  },
                                );
                              } else {
                                mainAppController.updateCartItemQuantity(index, val, context);
                              }
                            },
                            maxValue: mainAppController.cartItems[index].stock,
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
          title: mainAppController.cartItems.isEmpty || mainAppController.selectedCartItems.isEmpty
              ? AppTexts.continueShopping
              : AppTexts.checkout,
          showIcon: mainAppController.cartItems.isEmpty,
          onTap: () {
            mainAppController.cartItems.isEmpty || mainAppController.selectedCartItems.isEmpty
                ? Get.back()
                : AppRouter.openCheckoutPage(items: mainAppController.selectedCartItems);
          },
        ),
      ),
    );
  }
}
