import 'package:presentation/themes/app_colors.dart';
import 'package:presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({super.key, required this.title, required this.showDivider});
  final String title;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextsStyle.boldSmall),
        if (showDivider==true)
          Divider(thickness: 3, radius: BorderRadiusGeometry.circular(24), color: AppColors.secondary, endIndent: 350,)

      ],
    );
  }
}
