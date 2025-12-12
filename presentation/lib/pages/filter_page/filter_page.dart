import 'package:flutter/material.dart';
import 'package:presentation/pages/filter_page/widgets/add_to_category_button_widget.dart';
import 'package:presentation/pages/filter_page/widgets/price_slider_widget.dart';
import 'package:presentation/pages/filter_page/widgets/selected_category_button_widget.dart';
import 'package:presentation/pages/products_display_page/products_display_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import '../../util/enum/enums.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_text_styles.dart';
import 'package:get/get.dart';

import '../../util/widgets/open_container_animation_widget.dart';
import '../../view/category_view_model.dart';
import 'filter_controller.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  FilterController get filterController => Get.find();

  @override
  void dispose() {
    filterController.everWorkers.dispose();
    filterController.resetFilters();
    Get.delete<FilterController>();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    Get.put(FilterController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      filterController.initItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: AppTexts.filters,
        showBorder: true,
        iconColors: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {
              filterController.resetFilters();
            },
            child: Text(AppTexts.reset, style: AppTextsStyle.bold()),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final min = filterController.minPrice.value;
          final max = filterController.maxPrice.value;
          final range = filterController.priceRange.value;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 5),
                  child: HeaderTitleWidget(
                    itemViewModel: HeaderTitleViewModel(title: AppTexts.price, showDivider: false),
                  ),
                ),
                PriceSliderWidget(
                  onRangeChanged: filterController.onRangeChanged,
                  onRangeChangeEnd: filterController.onRangeChangeEnd,
                  min: min,
                  max: max,
                  range: range,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 16, bottom: 5),
                  child: HeaderTitleWidget(
                    itemViewModel: HeaderTitleViewModel(title: AppTexts.categoriesSelected, showDivider: false),
                  ),
                ),
                Obx(() {
                  final selected = filterController.selectedCategoryId.toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final id in selected)
                          SelectedCategoryButtonWidget(
                            id: id,
                            name: _nameFor(id),
                            onRemove: () => filterController.toggleCategory(id, false),
                          ),
                        AddToCategoryButtonWidget(
                          selectedIds: filterController.selectedCategoryId,
                          onSave: (List<CategoryViewModel> allCategories, Set<int> selectedIds) {
                            filterController.setCategoryData(
                              selectedIds: selectedIds.toSet(),
                              allCategories: allCategories.toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ),

      bottomNavigationBar: Obx(() {
        final isLoading = filterController.isLoading.value;
        final filteredCount = filterController.filteredCount.value;
        var hasProducts = filteredCount > 0;
        return OpenContainerAnimation(
          openBuilder: (context, _) => ProductsDisplayPage(
            type: ProductListType.filteredProducts,
            title: AppTexts.filteredProducts,
            selectedCategoryIds: filterController.selectedCategoryId.toList(),
            priceRange: filterController.priceRange.value,
          ),
          closedBuilder: (context, openContainer) {
            return BottomNavigationBarWidget(
              title: isLoading
                  ? AppTexts.loading
                  : (hasProducts ? '${AppTexts.showResults}($filteredCount)' : AppTexts.noProductsToShow),
              showIcon: false,
              onTap: isLoading ? null : openContainer,
            );
          },
        );
      }),
    );
  }

  String _nameFor(int id) {
    final c = filterController.categories.firstWhereOrNull((e) => e.id == id);
    return c!.name;
  }
}
