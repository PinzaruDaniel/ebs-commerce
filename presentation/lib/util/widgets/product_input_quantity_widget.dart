import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../themes/app_colors.dart';

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
  final int? maxValue;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return InputQty.int(
      qtyFormProps: QtyFormProps(enableTyping: false),
      decoration: QtyDecorationProps(
        btnColor: AppColors.primary,
        enabledBorder: InputBorder.none,
        isBordered: false,
        width: 8,
        borderShape: BorderShapeBtn.roundedRect,
      ),
      initVal: initialValue,
      minVal: minValue,
      maxVal: 2,
      onQtyChanged: (val) {
        print('Quantity changed to $val');
        onChanged(val);
      },
    );
  }
}
