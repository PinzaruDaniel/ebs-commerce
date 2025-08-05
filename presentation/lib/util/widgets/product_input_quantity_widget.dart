import 'dart:math';

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
    final bool isOutOfStock = maxValue == null;
    final int adjustMax = isOutOfStock ? 0 : maxValue;
    final int adjustMin = isOutOfStock ? 0 : minValue;
    final int initialVal=initialValue.clamp(adjustMin, adjustMax);

    return InputQty.int(
      qtyFormProps: QtyFormProps(enableTyping: false),
      decoration: QtyDecorationProps(
        btnColor: AppColors.primary,
        enabledBorder: InputBorder.none,
        isBordered: false,
        width: 8,
        borderShape: BorderShapeBtn.circle,
      ),
      initVal: initialVal,
      minVal: adjustMin,
      maxVal: adjustMax,
      onQtyChanged: (val) {
        print('Quantity changed to $val');
        onChanged(val);
      },
    );
  }
}
