import 'package:flutter/material.dart';

import '../../resources/app_icons.dart';

class BaseButtonWidget extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final bool showIcon;
  final Function()? onTap;
  final String title;

  const BaseButtonWidget({
    super.key,
    required this.buttonColor,
    required this.textColor,
    this.showIcon = false,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(12)),
      child: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () {
          onTap?.call();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon ? AppIcons.toCartIcon : SizedBox.shrink(),
            SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
