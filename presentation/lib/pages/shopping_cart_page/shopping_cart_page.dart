import 'package:presentation/pages/shopping_cart_page/cart_controller.dart';
import 'package:presentation/pages/shopping_cart_page/widgets/shopping_cart_checkbox_widget.dart';
import 'package:presentation/pages/shopping_cart_page/widgets/shopping_cart_title_widget.dart';
import 'package:presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';
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
    final cartItems = cartController.cartItems;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('Shopping Cart', style: AppTextsStyle.boldBig),
      ),
      body: Column(
        children: [
          if (cartItems.isEmpty) Container(color: Colors.lightGreen),
          Expanded(
            child: Obx(
              () => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        ShoppingCartCheckboxWidget(item: item),
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          child: Image.asset(item.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                        ),
                        ShoppingCartTitleWidget(item: item),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ProductInputQuantityWidget(
                              initialValue: item.quantity,
                              onChanged: (val) {
                                item.quantity = val;
                                cartController.cartItems.refresh();
                              }, maxValue: item.quantity,
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
