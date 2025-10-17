import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/resources/app_icons.dart';
import '../../../util/routing/app_pop_up.dart';

class SelectionViewModel<T> extends BaseViewModel {
  final String? keyId;
  final String? title;
  final List<T> options;
  final T selectedItem;

  SelectionViewModel({
    this.keyId,
    this.title,
    required this.options,
    required T initialValue,
  }) : selectedItem = initialValue;
}

class SelectionWidget<T> extends StatelessWidget {
  final SelectionViewModel<T> itemViewModel;
  final Function(T)? onSelectionChanged;
  final  Function(T)? displayText;

  const SelectionWidget({
    super.key,
    required this.itemViewModel,
    this.onSelectionChanged,
    this.displayText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (itemViewModel.title != null) ...[
          Text(itemViewModel.title!),
          const SizedBox(height: 4),
        ],
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if (itemViewModel.options.length > 1) {
              AppPopUp.showSelection<T>(
                title: itemViewModel.title ?? '',
                options: itemViewModel.options,
                selectedItem: itemViewModel.selectedItem,
                onSelectionChanged: onSelectionChanged,
              );
            } else {
              showFailureSnackBar(
                fallbackMessage: AppTexts.selectPreviousField,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  displayText?.call(itemViewModel.selectedItem) ??
                      itemViewModel.selectedItem.toString(),
                  style: TextStyle(
                    color: (displayText?.call(itemViewModel.selectedItem) ??
                        itemViewModel.selectedItem.toString())
                        .isEmpty
                        ? Colors.grey
                        : Colors.black,
                  ),
                ),
                Transform.rotate(
                  angle: 4.7,
                  child: AppIcons.backIcon(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}