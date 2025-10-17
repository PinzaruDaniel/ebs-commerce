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
  final OptionViewModel selectedItem;

  SelectionViewModel({this.keyId, this.title, required this.options, required OptionViewModel initialValue})
    : selectedItem = initialValue;
}

class SelectionWidget<T> extends StatelessWidget {
  final SelectionViewModel itemViewModel;
  final Function? onSelectionChanged;
  final Function? displayText;

  const SelectionWidget({super.key, required this.itemViewModel, this.onSelectionChanged, this.displayText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (itemViewModel.title != null) ...[Text(itemViewModel.title!), const SizedBox(height: 4)],
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if (itemViewModel.options.length > 1) {
              Iterable<CountryFlagDialCodeViewModel> countries = itemViewModel.options
                  .whereType<CountryFlagDialCodeViewModel>();
              print('options view model ${countries.map((e) => (e).countryCode)}');
              AppPopUp.showSelection(
                title: itemViewModel.title ?? '',
                selectionViewModel: itemViewModel,
                onSelect: () {},
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
                Text(
                  displayText?.call(itemViewModel.selectedItem) ?? itemViewModel.selectedItem.toString(),
                  style: TextStyle(
                    color:
                        (displayText?.call(itemViewModel.selectedItem) ?? itemViewModel.selectedItem.toString()).isEmpty
                        ? Colors.grey
                        : Colors.black,
                  ),
                ),
                Transform.rotate(angle: 4.7, child: AppIcons.backIcon(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
