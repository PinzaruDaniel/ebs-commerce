import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';

import '../resources/app_icons.dart';
import '../routing/app_router.dart';

class AppBarIconShoppingCartWidget extends StatelessWidget {
  const AppBarIconShoppingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                AppRouter.openShoppingCartPage();
              },
              icon: AppIcons.cartIcon,
            ),
            Obx(
              () => cartController.cartItems.isEmpty
                  ? SizedBox()
                  : Positioned(
                      top: 12,
                      left: 8,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: AppColors.red,
                        child: Text(
                          '${cartController.cartItems.length}',
                          style: AppTextsStyle.bold(size: 9, color: Colors.white),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
