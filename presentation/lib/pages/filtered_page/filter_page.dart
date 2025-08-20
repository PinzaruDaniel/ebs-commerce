import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/filtered_page/widgets/add_to_category_button_widget.dart';
import 'package:presentation/pages/filtered_page/widgets/price_slider_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/pages/filtered_page/widgets/selected_category_button_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/resources/app_text_styles.dart';
import 'package:get/get.dart';
import '../../util/widgets/circular_progress_indicator_widget.dart';
import '../products_display_page/products_display_controller.dart';
import '../shopping_cart_page/enum/product_type.dart';
import 'filter_controller.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      filterController.getFilteredProducts(page: 1);
    });
    filterController.filteredProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: AppTexts.filters,
        showBorder: true,
        iconColors: AppColors.primary,
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
                  final selected = categoryController.selectedCategoryId.toList();
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
                            onRemove: () => categoryController.toggleCategory(id, false),
                          ),
                        AddToCategoryButtonWidget(),
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
        return BottomNavigationBarWidget(
          item: dummyProduct,
          title: filterController.isLoading.value
              ? 'Loading...'
              : (filterController.filteredCount.value > 0
                    ? '${AppTexts.showResults}(${filterController.filteredCount.value})'
                    : AppTexts.noProductsToShow),
          showIcon: false,
          addToCart: filterController.filteredProducts.isNotEmpty,
          router: () {
            AppRouter.openProductsDisplayPage(type: ProductListType.filteredProducts, title: AppTexts.filteredProducts);
          },
          titleDialog: AppTexts.oops,
          contentDialog: AppTexts.noProductsToShow,
        );
      }),
    );
  }

  String _nameFor(int id) {
    final c = categoryController.categories.firstWhereOrNull((e) => e.id == id);
    return c!.name;
  }
}
