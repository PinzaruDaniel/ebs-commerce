import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';

import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';
import 'selection_widget.dart';

class OptionPickerWidget<T> extends StatefulWidget {
  final String title;
  final SelectionViewModel selectionViewModel;
  final Function() onSelect;

  const OptionPickerWidget({super.key, required this.title, required this.selectionViewModel, required this.onSelect});

  @override
  State<OptionPickerWidget<T>> createState() => _OptionPickerWidgetState<T>();
}

class _OptionPickerWidgetState<T> extends State<OptionPickerWidget<T>> {
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

    debounce = Timer(const Duration(milliseconds: 300), () {
      final query = searchController.text.toLowerCase();

      setState(() {
        filteredOptions = widget.selectionViewModel.options.where((opt) {
          final data = opt.data;
          String countryCode = '';
          String countryName = '';
          String countryDialCode = '';

          try {
            countryCode = (data as dynamic).iso2?.toLowerCase() ?? '';
          } catch (_) {}

          try {
            countryName = (data as dynamic).name?.toLowerCase() ?? '';
          } catch (_) {}

          try {
            countryDialCode = (data as dynamic).dialCode?.toLowerCase() ?? '';
          } catch (_) {}

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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Center(
                      child: Text(
                        '${AppTexts.choose} ${widget.title.toLowerCase()}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (filteredOptions.isNotEmpty) {
                          final selectedIndex = scrollController.selectedItem;
                          widget.selectionViewModel.selectedItem = filteredOptions[selectedIndex];
                          widget.onSelect();
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                        child: Text(AppTexts.done, style: AppTextsStyle.medium.copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: TextFieldWidget(
                  itemViewModel: TextFieldViewModel(textController: searchController, isRequiredValidation: false),
                ),
              ),
              SizedBox(
                height: Get.height * 0.25,
                child: filteredOptions.isEmpty
                    ? const Center(child: Text('No results found'))
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
                        children: filteredOptions
                            .map(
                              (opt) =>
                                  Center(child: Text(opt.titleKey, style: AppTextsStyle.medium.copyWith(fontSize: 23))),
                            )
                            .toList(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
