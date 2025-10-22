import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  late final FixedExtentScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';
//TODO:withoutSearchQuery
  @override
  void initState() {
    super.initState();

    final initialIndex = widget.selectionViewModel.options.indexWhere(
      (option) => option.data == widget.selectionViewModel.selectedItem.data,
    );
    _scrollController = FixedExtentScrollController(initialItem: initialIndex == -1 ? 0 : initialIndex);

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allOptions = widget.selectionViewModel.options;

    final filteredOptions = allOptions.where((opt) => opt.titleKey.toLowerCase().contains(_searchQuery)).toList();

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Center(
                      child: Text(
                        '${AppTexts.choose} ${widget.title.toLowerCase()}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        final selectedIndex = _scrollController.selectedItem;
                        if (filteredOptions.isNotEmpty) {
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
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
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
                        scrollController: _scrollController,
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
