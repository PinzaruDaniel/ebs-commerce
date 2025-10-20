
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/country_flag_dial_code_view_model.dart';

import '../../../util/resources/app_icons.dart';
import '../../../util/routing/app_pop_up.dart';

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

  SelectionViewModel({
    this.keyId,
    this.title,
    required this.options,
    required OptionViewModel initialValue,
    this.displayText,
  }) : selectedItem = initialValue;
}

class SelectionWidget<T> extends StatelessWidget {
  final SelectionViewModel itemViewModel;
  final Function? onSelectionChanged;

  const SelectionWidget({super.key, required this.itemViewModel, this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    final String displayText = itemViewModel.displayText?.call(itemViewModel.selectedItem)
        ?? itemViewModel.selectedItem.titleKey
        ?? itemViewModel.selectedItem.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (itemViewModel.title != null) ...[Text(itemViewModel.title!), const SizedBox(height: 4)],
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            print('display Text: $displayText');

            if (itemViewModel.options.length > 1) {
              Iterable<CountryFlagDialCodeViewModel> countries = itemViewModel.options
                  .whereType<CountryFlagDialCodeViewModel>();
              AppPopUp.showSelection(
                title: itemViewModel.title ?? '',
                selectionViewModel: itemViewModel,
                onSelect: (){
                  if (onSelectionChanged != null) {
                    onSelectionChanged!(itemViewModel.selectedItem);
                  }
                }
              );
            } else {
              showFailureSnackBar(fallbackMessage: AppTexts.selectPreviousField);
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
                Text(displayText, style: TextStyle(color: displayText.isEmpty ? Colors.grey : Colors.black)),

                Transform.rotate(angle: 4.7, child: AppIcons.backIcon(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
