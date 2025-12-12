import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/view/base_view_model.dart';

import '../resources/app_icons.dart';
import '../routing/app_pop_up.dart';

class OptionViewModel<T> extends BaseViewModel {
  final T data;
  final String titleKey;

  OptionViewModel({required this.data, required this.titleKey});
}

class SelectionViewModel<T> extends BaseViewModel {
  final String? keyId;
  final String? title;
  final List<OptionViewModel> options;
  OptionViewModel selectedItem;
  final Function? displayText;
  final bool? showTitle;

  SelectionViewModel({
    this.keyId,
    this.title,
    this.showTitle = true,
    required this.options,
    required OptionViewModel initialValue,
    this.displayText,
  }) : selectedItem = initialValue;
}

class SelectionWidget<T> extends StatefulWidget {
  final SelectionViewModel itemViewModel;
  final Function? onSelect;

  const SelectionWidget({super.key, required this.itemViewModel, this.onSelect});

  @override
  State<SelectionWidget<T>> createState() => _SelectionWidgetState<T>();
}

class _SelectionWidgetState<T> extends State<SelectionWidget<T>> {
  Widget displayWidget() {
    final Widget displayWidget;
    if (widget.itemViewModel.displayText != null) {
      displayWidget = widget.itemViewModel.displayText!(widget.itemViewModel.selectedItem);
    } else {
      displayWidget = Text(
        widget.itemViewModel.selectedItem.titleKey,
        style: TextStyle(color: widget.itemViewModel.selectedItem.titleKey.isEmpty ? Colors.grey : Colors.black),
      );
    }
    return displayWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.itemViewModel.title != null && widget.itemViewModel.showTitle == true) ...[
          Text(widget.itemViewModel.title!),
          const SizedBox(height: 4),
        ],
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if (widget.itemViewModel.options.isNotEmpty) {
              AppPopUp.showSelection(
                title: widget.itemViewModel.title ?? '',
                selectionViewModel: widget.itemViewModel,
                onSelect: () {
                  setState(() {});
                  if (widget.onSelect != null) {
                    widget.onSelect!(widget.itemViewModel.selectedItem);
                  }
                },
              );
            } else {
              AppPopUp.showFailureSnackBar(
                  fallbackMessage: AppTexts.selectPreviousField, title: '');

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
                displayWidget(),
                Transform.rotate(angle: 4.7, child: AppIcons.backIcon(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
