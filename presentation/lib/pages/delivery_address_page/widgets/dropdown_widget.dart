import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/base_view_model.dart';

class SelectionViewModel extends BaseViewModel {
  final String title;
  final List<String> options;
  final RxString selectedValue;
  final Function(String)? onSelectionChanged;

  SelectionViewModel({
    required this.title,
    required this.options,
    String? initialValue,
    this.onSelectionChanged,
  }) : selectedValue =
           (initialValue ?? (options.isNotEmpty ? options.first : '')).obs {
    selectedValue.listen((value) {
      if (onSelectionChanged != null) {
        onSelectionChanged!(value);
      }
    });
  }
}

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({super.key, required this.itemViewModel});

  final SelectionViewModel itemViewModel;

  void _showCupertinoPicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Choose ${itemViewModel.title.toLowerCase()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 30,
                  useMagnifier: true,
                  magnification: 1.2,
                  selectionOverlay: Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (int index) {
                    itemViewModel.selectedValue.value =
                        itemViewModel.options[index];
                  },
                  scrollController: FixedExtentScrollController(
                    initialItem: itemViewModel.options.indexOf(
                      itemViewModel.selectedValue.value,
                    ),
                  ),
                  children: itemViewModel.options.map((String option) {
                    return Center(
                      child: Text(
                        option,
                        style: AppTextsStyle.medium.copyWith(fontSize: 23),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
            () => GestureDetector(
              onTap: () => _showCupertinoPicker(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemViewModel.selectedValue.value,
                      style: const TextStyle(color: Colors.black),
                    ),
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
