import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import '../../../util/resources/app_colors.dart';
import '../../../util/resources/app_icons.dart';

class ProductDetailBackIconGlassWidget extends StatelessWidget {
  const ProductDetailBackIconGlassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
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
            Get.back();
          },
          icon: AppIcons.backIcon(color: AppColors.blue, size: 20),
        ),
      ],
    );
  }
}
