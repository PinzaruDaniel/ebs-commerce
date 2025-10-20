import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/delivery_address_page/widgets/selection_widget.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';

class OptionPickerWidget<T> extends StatefulWidget {
  final String title;
  final SelectionViewModel selectionViewModel;
  final Function() onSelect;

  const OptionPickerWidget({super.key, required this.title, required this.selectionViewModel, required this.onSelect});

  @override
  State<OptionPickerWidget<T>> createState() => _OptionPickerWidgetState<T>();
}

class _OptionPickerWidgetState<T> extends State<OptionPickerWidget<T>> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectionViewModel.options.indexWhere(
      (option) => option.data == widget.selectionViewModel.selectedItem.data,
    );
    print('this is index of selectedItem start: $selectedIndex');
  }

  @override
  Widget build(BuildContext context) {
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: AppColors.primary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        print('this is index of selectedItem ontap: $selectedIndex');
                        widget.selectionViewModel.selectedItem = widget.selectionViewModel.options[selectedIndex];
                        widget.onSelect();
                        print('dial code changed to: ${widget.selectionViewModel.selectedItem.titleKey}');
                        Navigator.pop(context);
                      },
                      child: Text('Done', style: AppTextsStyle.medium.copyWith(color: Colors.white)),
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
            scrollController: FixedExtentScrollController(
              initialItem: widget.selectionViewModel.options.indexWhere(
                (option) => option.data == widget.selectionViewModel.selectedItem.data,
              ),
            ),
            selectionOverlay: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: widget.selectionViewModel.options
                .map((opt) => Center(child: Text(opt.titleKey, style: AppTextsStyle.medium.copyWith(fontSize: 23))))
                .toList(),
          ),
        ),
      ],
    );
  }
}
