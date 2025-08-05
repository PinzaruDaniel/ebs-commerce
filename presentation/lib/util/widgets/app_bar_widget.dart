import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_text_styles.dart';

import '../resources/app_icons.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? iconColors;
  final bool showBorder;

  const AppBarWidget({super.key, this.title, this.actions, this.iconColors, required this.showBorder, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: showBorder ? Colors.black12 : Colors.transparent)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading:
          leading ??
          IconButton(
            icon: AppIcons.backIcon(color: iconColors, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
      actions: actions,
      title: Text(title ?? '', style: AppTextsStyle.bold(size: 18)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
