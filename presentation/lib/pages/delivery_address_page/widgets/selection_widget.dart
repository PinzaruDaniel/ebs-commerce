import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/resources/app_icons.dart';
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

  bool _isPlaceholder(String value) {
    var placeholders = ['Select country', 'Select region', 'Select city'];
    return placeholders.contains(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemViewModel.title),
          SizedBox(height: 4),
          Obx(() {
            final isPlaceholder = _isPlaceholder(itemViewModel.selectedValue.value);

            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                if (itemViewModel.options.length > 1) {
                  AppPopUp.showSelection(
                    title: itemViewModel.title,
                    options: itemViewModel.options,
                    selectedValue: itemViewModel.selectedValue,
                    onSelectionChanged: onSelectionChanged,
                  );
                } else {
                  showFailureSnackBar(fallbackMessage: AppTexts.selectPreviousField);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemViewModel.selectedValue.value,
                      style: TextStyle(color: isPlaceholder ? Colors.grey : Colors.black),
                    ),
                    Transform.rotate(angle: 4.7, child: AppIcons.backIcon(color: Colors.grey)),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
