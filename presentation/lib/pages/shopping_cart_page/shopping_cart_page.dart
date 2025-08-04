import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/pages/shopping_cart_page/widgets/shopping_cart_checkbox_widget.dart';
import 'package:presentation/pages/shopping_cart_page/widgets/shopping_cart_title_widget.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_images.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/circular_progress_indicator_page_widget.dart';
import '../../util/widgets/product_input_quantity_widget.dart';

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
                        ShoppingCartCheckboxWidget(item: item),
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          child: Image(
                            image: (item.imageUrl != null && item.imageUrl!.isNotEmpty)
                                ? NetworkImage(item.imageUrl!)
                                : const AssetImage(AppImages.noImage) as ImageProvider,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicatorPageWidget(
                                boxConstraints: BoxConstraints(minHeight: 40, minWidth: 40),
                                heightFactor: 2.5,
                              );
                            },
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
    );
  }
}
