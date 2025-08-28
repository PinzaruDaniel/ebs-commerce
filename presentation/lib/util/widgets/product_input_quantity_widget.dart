import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

import '../resources/app_colors.dart';

class ProductInputQuantityWidget extends StatelessWidget {
  const ProductInputQuantityWidget({
    super.key,
    required this.initialValue,
    this.minValue = 1,
    required this.onChanged,
    required this.maxValue,
  });

  final int initialValue;
  final int minValue;
  final dynamic maxValue;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    final int adjustMax = maxValue;
    final int adjustMin = minValue;
    final int initialVal = initialValue.clamp(adjustMin, adjustMax);

    return InputQty.int(
      qtyFormProps: QtyFormProps(enableTyping: false),
      decoration: QtyDecorationProps(
        btnColor: AppColors.primary,
        enabledBorder: InputBorder.none,
        isBordered: false,
        width: 8,
        borderShape: BorderShapeBtn.none,
        plusBtn: Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300)),
          child: Icon(Icons.add_rounded, size: 24, color: AppColors.primary,),
        ),
        minusBtn: Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300)),
          child: Icon(Icons.remove_rounded, size: 24, color: AppColors.primary,),
        ),
      ),
      initVal: initialVal,
      minVal: adjustMin,
      maxVal: adjustMax,
      onQtyChanged: (val) {
        onChanged(val);
      },
    );
  }
}
