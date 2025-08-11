import 'package:flutter/material.dart';
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
import '../../util/widgets/circular_progress_indicator_page_widget.dart';
import '../../view/base_view_model.dart';
import '../../view/product_list_type_enum.dart';
import '../category_picker_page/category_controller.dart';
import 'filter_controller.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  CategoryController get catController => Get.find();

  FilterController get filController => Get.find();

  @override
  void initState() {
    super.initState();
    filController.getAllProducts();
    filController.filteredProducts;
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
              filController.resetFilters();
            },
            child: Text(AppTexts.reset, style: AppTextsStyle.bold()),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (filController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicatorPageWidget(
                boxConstraints: BoxConstraints(minWidth: 75, minHeight: 75),
              ),
            );
          }

          final min = filController.minPrice.value;
          final max = filController.maxPrice.value;
          final range = filController.priceRange.value;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 5),
                  child: HeaderTitleWidget(title: AppTexts.price, showDivider: false),
                ),
                PriceSliderWidget(
                  onRangeChanged: filController.onRangeChanged,
                  onRangeChangeEnd: filController.onRangeChangeEnd,
                  min: min,
                  max: max,
                  range: range,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 16, bottom: 5),
                  child: HeaderTitleWidget(title: AppTexts.categoriesSelected, showDivider: false),
                ),
                Obx(() {
                  final selected = catController.selectedCategoryId.toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final id in selected)
                          SelectedCategoryButtonWidget(
                            id: id,
                            name: _nameFor(catController, id),
                            onRemove: () => catController.toggleCategory(id, false),
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
        if (filController.isLoading.value) {
          return  SizedBox();
        }

        return BottomNavigationBarWidget(
          item: dummyProduct,
          title: filController.filteredProducts.isNotEmpty
              ? '${AppTexts.showResults}(${filController.filteredProducts.length})'
              : AppTexts.noProductsToShow,
          showIcon: false,
          addToCart: filController.filteredProducts.isNotEmpty,
          router: () {
            AppRouter.openProductsDisplayPage(
              type: ProductListType.allProducts,
              title: AppTexts.filteredProducts,
            );
          },
          titleDialog: AppTexts.oops,
          contentDialog: AppTexts.noProductsToShow,
        );
      }),

    );
  }

  String _nameFor(CategoryController categoryController, int id) {
    final c = categoryController.categories.firstWhereOrNull((e) => e.id == id);
    return c!.name;
  }
}
