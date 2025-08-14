import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_icons.dart';



class CheckoutInfoCardWidget extends StatelessWidget {
  const CheckoutInfoCardWidget({super.key, this.onTap});
  final VoidCallback? onTap;
  //final Widget content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300)
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Container()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.flip(
                  flipX: true,
                  child: AppIcons.backIcon(color: AppColors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
