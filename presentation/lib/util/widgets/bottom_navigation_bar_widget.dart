import 'package:presentation/util/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_texts.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final String title;
  final String? titleDialog;
  final String? contentDialog;
  final Function()? onTap;
  final bool? addToCart;
  final bool showIcon;

  const BottomNavigationBarWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.showIcon,
    this.addToCart,
    this.titleDialog,
    this.contentDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 12)],
      ),
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: (addToCart ?? true) ? AppColors.primary : Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
        onPressed: () {
          if (addToCart == true) {
            onTap?.call();
          } else if (addToCart == false) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(titleDialog ?? ''),
                content: Text(contentDialog ?? ''),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(AppTexts.ok, style: TextStyle(color: AppColors.primary)),
                  ),
                ],
              ),
            );
          } else {
            onTap?.call();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon ? AppIcons.toCartIcon : SizedBox.shrink(),
            SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
