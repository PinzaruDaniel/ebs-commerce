import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import '../resources/app_icons.dart';
import '../routing/app_router.dart';

class AppBarIconShoppingCartWidget extends StatelessWidget {
  final bool showLiquid;

  const AppBarIconShoppingCartWidget({super.key, this.showLiquid = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showLiquid)
            LiquidGlassLayer(
              settings: LiquidGlassSettings(
                glassColor: Color.fromARGB(65, 255, 255, 255),
                blur: 2,
                lightAngle: 10 * 3.14,
                chromaticAberration: 0.5,
                ambientStrength: 2,
                  thickness: 30

              ),
              child: LiquidGlass(
                glassContainsChild: false,
                shape: LiquidRoundedSuperellipse(borderRadius: 50),

                child: SizedBox(height: 46, width: 46),
              ),
            ),
          IconButton(
            onPressed: () {
              AppRouter.openShoppingCartPage();
            },
            icon: AppIcons.cartIcon,
          ),
          Obx(
            () => mainAppController.cartItems.isEmpty
                ? const SizedBox()
                : Positioned(
                    top: 12,
                    left: 8,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColors.red,
                      child: Text(
                        '${mainAppController.cartItems.length}',
                        style: AppTextsStyle.bold(size: 9, color: Colors.white),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
