import 'package:presentation/util/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool showIcon;
  final Color? buttonColor;
  final Color? textColor;
  const BottomNavigationBarWidget({
    super.key,
    required this.title,
    this.onTap,
    this.showIcon = false,
     this.textColor,
     this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 12)],
      ),
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: BaseButtonWidget(
          showIcon: showIcon,
          buttonColor: buttonColor ?? AppColors.primary,
          textColor: textColor ?? Colors.white,
          onTap: () {
            onTap?.call();
          },
          title: title,
        ),
      ),
    );
  }
}
