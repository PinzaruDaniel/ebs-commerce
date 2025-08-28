import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

import '../resources/app_colors.dart';

class ProductInputQuantityWidget extends StatefulWidget {
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
  State<ProductInputQuantityWidget> createState() => _ProductInputQuantityWidgetState();
}

class _ProductInputQuantityWidgetState extends State<ProductInputQuantityWidget> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue.clamp(widget.minValue, widget.maxValue!);
  }

  @override
  Widget build(BuildContext context) {
    final isAtMin = _currentValue <= widget.minValue;
    final isAtMax = _currentValue >= widget.maxValue!;

    return InputQty.int(
      initVal: _currentValue,
      minVal: widget.minValue,
      maxVal: widget.maxValue!,
      onQtyChanged: (val) {
        _currentValue = val;
        widget.onChanged(val);
      },
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
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(Icons.add_rounded, size: 24, color: isAtMax ? Colors.grey : AppColors.primary),
        ),
        minusBtn: Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(Icons.remove_rounded, size: 24, color: isAtMin ? Colors.grey : AppColors.primary),
        ),
      ),
    );
  }
}

/*onQtyChanged: (val) {
setState(() {
_currentValue = val;
});
widget.onChanged(val);
},*/
