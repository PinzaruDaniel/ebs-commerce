import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
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
  State<ProductInputQuantityWidget> createState() =>
      _ProductInputQuantityWidgetState();
}

class _ProductInputQuantityWidgetState extends State<ProductInputQuantityWidget> {
   int currentValue=0;

  @override
  void initState() {
    super.initState();
    currentValue =
        widget.initialValue.clamp(widget.minValue, widget.maxValue ?? double.maxFinite.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButton(Icons.remove_rounded, onPressed: () {
          setState(() {
            final value = currentValue - 1;
            if (value < widget.minValue) {
              widget.onChanged(0);
            } else {
              currentValue = value;
              widget.onChanged(value);
            }
          });
        }),
        SizedBox(
          width: Get.height * 0.05,
          child: TextField(
            readOnly: true,
            controller: TextEditingController(text: currentValue.toString()),
            textAlign: TextAlign.center,
            style: AppTextsStyle.bold(size: 16),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        _buildButton(Icons.add_rounded, onPressed: () {
          setState(() {
            final value = currentValue + 1;
            if (value <= (widget.maxValue ?? double.maxFinite.toInt())) {
              currentValue = value;
              widget.onChanged(value);
            }
          });
        }),
      ],
    );
  }

  Widget _buildButton(IconData icon, {VoidCallback? onPressed}) {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        icon: Icon(icon, size: 24, color: AppColors.primary),
      ),
    );
  }
}
