import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class SelectCheckboxWidget extends StatelessWidget {
  final bool? selected;
  final String? title;
  final TextStyle? textStyle;
  final bool? tristate;
  final Color? selectedColor;
  final void Function(bool?)? onChanged;
  const SelectCheckboxWidget({super.key, this.selected,  this.title,  this.textStyle, this.onChanged, this.tristate=true, this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                side: BorderSide(color: Colors.grey.shade300, width: 2),
                tristate: tristate! ? true: false ,
                value: selected,
                onChanged: onChanged,
                activeColor: selectedColor ?? AppColors.primary,
              ),
            ),
          ],
        ),

        title != null ?
        Expanded(child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(title!, style: textStyle),
        )): SizedBox(height: 20, width: 20,),
      ],
    );
  }
}
