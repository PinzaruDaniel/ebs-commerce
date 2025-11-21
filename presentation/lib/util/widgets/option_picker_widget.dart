import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/city_view_model.dart';
import 'package:presentation/view/country_flag_dial_code_view_model.dart';
import 'package:presentation/view/country_view_model.dart';
import 'package:presentation/view/state_view_model.dart';

import '../resources/app_icons.dart';
import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';
import 'selection_widget.dart';

class OptionPickerWidget<T> extends StatefulWidget {
  final String title;
  final SelectionViewModel selectionViewModel;
  final Function() onSelect;

  const OptionPickerWidget({super.key, required this.title, required this.selectionViewModel, required this.onSelect});

  @override
  State<OptionPickerWidget<T>> createState() => OptionPickerWidgetState<T>();
}

class OptionPickerWidgetState<T> extends State<OptionPickerWidget<T>> {
  FixedExtentScrollController scrollController = FixedExtentScrollController();
  final TextEditingController searchController = TextEditingController();

  List<OptionViewModel> filteredOptions = [];
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    filteredOptions = widget.selectionViewModel.options;
    final initialIndex = widget.selectionViewModel.options.indexWhere(
      (option) => option.data == widget.selectionViewModel.selectedItem.data,
    );
    scrollController = FixedExtentScrollController(initialItem: initialIndex == -1 ? 0 : initialIndex);

    searchController.addListener(onSearchChanged);
  }

  void onSearchChanged() {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 700), () {
      final query = searchController.text.toLowerCase();
      setState(() {
        filteredOptions = widget.selectionViewModel.options.where((opt) {
          final data = opt.data;
          String countryCode = '';
          String countryName = '';
          String countryDialCode = '';

          if (data is CountryFlagDialCodeViewModel) {
            countryCode = data.iso2.toLowerCase();
            countryName = data.name.toLowerCase();
            countryDialCode = data.dialCode;
          } else if (data is CountryViewModel) {
            countryCode = data.iso2.toLowerCase();
            countryName = data.name.toLowerCase();
          } else if (data is CityViewModel || data is StateViewModel) {
            countryName = data.name.toLowerCase();
          }

          final titleKey = opt.titleKey.toLowerCase();

          return titleKey.contains(query) ||
              countryCode.contains(query) ||
              countryName.contains(query) ||
              countryDialCode.contains(query);
        }).toList();

        if (filteredOptions.isNotEmpty) {
          scrollController.jumpToItem(0);
        }
      });
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void onDone() {
    if (filteredOptions.isNotEmpty) {
      final selectedIndex = scrollController.selectedItem;
      widget.selectionViewModel.selectedItem = filteredOptions[selectedIndex];
      widget.onSelect();
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12),
          child: TextFieldWidget(
            itemViewModel: TextFieldViewModel(
              hintText: AppTexts.search,
              textController: searchController,
              isRequiredValidation: false,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.25,
          child: filteredOptions.isEmpty
              ? Center(child: Text(AppTexts.nothingToShow))
              : CupertinoPicker(
                  itemExtent: 32,
                  useMagnifier: true,
                  magnification: 1.2,
                  scrollController: scrollController,
                  selectionOverlay: Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300)),
                    ),
                  ),
                  onSelectedItemChanged: (_) {},
                  children: filteredOptions.map((opt) {
                    final data = opt.data;
                    if (data is CountryFlagDialCodeViewModel) {
                      return SizedBox(
                        width: Get.width*0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: AppIcons.countryFlag(iso2: data.iso2.toLowerCase()),
                            ),
                            const SizedBox(width: 8),
                            Flexible(child: Text(opt.titleKey, style: AppTextsStyle.medium.copyWith(fontSize: 23), overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: Text(opt.titleKey, style: AppTextsStyle.medium.copyWith(fontSize: 23)));
                    }
                  }).toList(),
                ),
        ),
      ],
    );
  }
}
