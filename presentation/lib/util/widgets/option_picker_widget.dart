import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';
import 'selection_widget.dart';

class OptionPickerWidget<T> extends StatefulWidget {
  final String title;
  final SelectionViewModel selectionViewModel;
  final Function() onSelect;

  const OptionPickerWidget({
    super.key,
    required this.title,
    required this.selectionViewModel,
    required this.onSelect,
  });

  @override
  State<OptionPickerWidget<T>> createState() => _OptionPickerWidgetState<T>();
}

class _OptionPickerWidgetState<T> extends State<OptionPickerWidget<T>> {
  late final FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    final initialIndex = widget.selectionViewModel.options.indexWhere(
          (option) => option.data == widget.selectionViewModel.selectedItem.data,
    );

    _scrollController = FixedExtentScrollController(
      initialItem: initialIndex == -1 ? 0 : initialIndex,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.selectionViewModel.options;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Choose ${widget.title.toLowerCase()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    final selectedIndex = _scrollController.selectedItem;
                    widget.selectionViewModel.selectedItem =
                    options[selectedIndex];
                    widget.onSelect();
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.primary,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 10,
                    ),
                    child: Text(
                      'Done',
                      style: AppTextsStyle.medium.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Get.height * 0.25,
          child: CupertinoPicker(
            itemExtent: 32,
            useMagnifier: true,
            magnification: 1.2,
            scrollController: _scrollController,
            selectionOverlay: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            onSelectedItemChanged: (_) {},
            children: options
                .map(
                  (opt) => Center(
                child: Text(
                  opt.titleKey,
                  style: AppTextsStyle.medium.copyWith(fontSize: 23),
                ),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}