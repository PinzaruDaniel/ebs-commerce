import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/routing/app_pop_up.dart';

class SelectionViewModel extends BaseViewModel {
  final String title;
  final List<String> options;
  final RxString selectedValue;
  final Function(String)? onSelectionChanged;

  SelectionViewModel({
    required this.title,
    required this.options,
    String? initialValue,
    this.onSelectionChanged,
  }) : selectedValue =
           (initialValue ?? (options.isNotEmpty ? options.first : '')).obs {
    selectedValue.listen((value) {
      if (onSelectionChanged != null) {
        onSelectionChanged!(value);
      }
    });
  }
}

class SelectionWidget extends StatelessWidget {
  final SelectionViewModel itemViewModel;

  const SelectionWidget({super.key, required this.itemViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemViewModel.title),
          const SizedBox(height: 4),
          Obx(
            () => GestureDetector(
              onTap: () => AppPopUp.showSelection(
                title: itemViewModel.title,
                options: itemViewModel.options,
                selectedValue: itemViewModel.selectedValue,
                onSelectionChanged: itemViewModel.onSelectionChanged,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemViewModel.selectedValue.value,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
