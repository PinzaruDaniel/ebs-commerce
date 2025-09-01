import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';

class OptionPickerWidget extends StatelessWidget {
  final String title;
  final List<String> options;
  final RxString selectedValue;
  final Function(String)? onSelectionChanged;

  const OptionPickerWidget({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Choose ${title.toLowerCase()}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: AppColors.primary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        if (onSelectionChanged != null) {
                          onSelectionChanged!(selectedValue.value);
                        }
                      },
                      child: Text('Done', style: AppTextsStyle.medium.copyWith(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: Get.height * 0.25,
          child: CupertinoPicker(
            itemExtent: 32,
            useMagnifier: true,
            magnification: 1.2,
            selectionOverlay: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
            scrollController: FixedExtentScrollController(initialItem: options.indexOf(selectedValue.value)),
            onSelectedItemChanged: (int index) {
              selectedValue.value = options[index];
            },
            children: options
                .map((opt) => Center(child: Text(opt, style: AppTextsStyle.medium.copyWith(fontSize: 23))))
                .toList(),
          ),
        ),
      ],
    );
  }
}
