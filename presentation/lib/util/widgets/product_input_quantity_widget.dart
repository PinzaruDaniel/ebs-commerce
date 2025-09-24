import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
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
  final int? maxValue;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    final RxInt currentValue = initialValue.clamp(minValue, maxValue ?? double.maxFinite.toInt()).obs;
    final controller = TextEditingController(text: currentValue.value.toString());

    ever(currentValue, (value) {
      controller.text = value.toString();
    });

    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: IconButton(
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: currentValue.value <= minValue
                  ? () {
                      if (minValue == 1) {
                        onChanged(0);
                      }
                    }
                  : () {
                      final value = currentValue.value - 1;
                      if (value < minValue) {
                        onChanged(0);
                      } else {
                        currentValue.value = value;
                        onChanged(value);
                      }
                    },
              icon: Icon(Icons.remove_rounded, size: 24, color: AppColors.primary),
            ),
          ),
          SizedBox(
            width: Get.height * 0.05,
            child: TextField(
              readOnly: true,
              controller: controller,
              textAlign: TextAlign.center,
              style: AppTextsStyle.bold(size: 16),
              decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.zero),
              onChanged: (value) {
                final intValue = int.tryParse(value) ?? currentValue.value;
                final clampedValue = intValue.clamp(minValue, maxValue ?? double.maxFinite.toInt());
                if (intValue != clampedValue) {
                  controller.text = clampedValue.toString();
                }
                currentValue.value = clampedValue;
                onChanged(clampedValue);
              },
            ),
          ),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: IconButton(
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: currentValue.value >= (maxValue ?? double.maxFinite.toInt())
                  ? null
                  : () {
                      final value = currentValue.value + 1;
                      currentValue.value = value;
                      onChanged(value);
                    },
              icon: Icon(
                Icons.add_rounded,
                size: 24,
                color: currentValue.value >= (maxValue ?? double.maxFinite.toInt()) ? Colors.grey : AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
