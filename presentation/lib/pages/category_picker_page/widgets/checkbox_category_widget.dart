import 'package:flutter/material.dart';

import '../../../util/resources/app_colors.dart';

class CheckboxCategoryWidget extends StatelessWidget {
  final bool? selected;
  final String title;
  final TextStyle textStyle;
  final void Function(bool?)? onChanged;

  const CheckboxCategoryWidget({
    super.key,
    this.selected,
    required this.title,
    required this.textStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: Colors.grey.shade300, width: 2),
          tristate: true,
          value: selected,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
        Expanded(child: Text(title, style: textStyle)),
      ],
    );
  }
}
