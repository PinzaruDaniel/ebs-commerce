import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/routing/app_pop_up.dart';

class SelectionViewModel extends BaseViewModel {
  final String? keyId;
  final String title;
  final List<String> options;
  final RxString selectedValue;

  SelectionViewModel({this.keyId, required this.title, required this.options, String? initialValue})
    : selectedValue = (initialValue ?? (options.isNotEmpty ? options.first : '')).obs;
}

class SelectionWidget extends StatelessWidget {
  final SelectionViewModel itemViewModel;
  final Function(String)? onSelectionChanged;

  const SelectionWidget({super.key, required this.itemViewModel, this.onSelectionChanged});

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
            () => InkWell(
              splashColor: Colors.transparent,
              onTap: () => AppPopUp.showSelection(
                title: itemViewModel.title,
                options: itemViewModel.options,
                selectedValue: itemViewModel.selectedValue,
                onSelectionChanged: onSelectionChanged,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(itemViewModel.selectedValue.value, style: const TextStyle(color: Colors.black)),
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
