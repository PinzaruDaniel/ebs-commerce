import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class SelectCheckboxWidget extends StatelessWidget {
  final bool? selected;
  final String? title;
  final TextStyle? textStyle;
  final bool? tristate;
  final void Function(bool?)? onChanged;
  const SelectCheckboxWidget({super.key, this.selected,  this.title,  this.textStyle, this.onChanged, this.tristate=true});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
            activeColor: AppColors.primary,
          ),
        ),

        title != null ?
        Expanded(child: Text(title!, style: textStyle)): SizedBox(height: 20, width: 20,),
      ],
    );
  }
}
