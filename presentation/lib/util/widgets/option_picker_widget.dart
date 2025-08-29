import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/app_text_styles.dart';

class OptionPickerWidget extends StatelessWidget {
  final String title;
  final List<String> options;
  final RxString selectedValue;
  final Function(String)? onSelectionChanged;

  const OptionPickerWidget(
      {super.key, required this.title, required this.options, required this.selectedValue, required this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Choose ${title.toLowerCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
              if (onSelectionChanged != null) {
                onSelectionChanged!(options[index]);
              }
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