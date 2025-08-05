import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presentation/pages/filtered_page/widgets/add_to_category_button_widget.dart';
import 'package:presentation/util/pages/products_display_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/pages/filtered_page/widgets/selected_category_button_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../util/resources/app_text_styles.dart';
import 'package:get/get.dart';
import '../../util/resources/app_icons.dart';
import '../../util/widgets/circular_progress_indicator_page_widget.dart';
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
    Get.put(CategoryController());
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
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
            return CircularProgressIndicatorPageWidget(boxConstraints: BoxConstraints(minHeight: 75, minWidth: 75));
          }

          final min = filController.minPrice.value;
          final max = filController.maxPrice.value;
          final range = filController.priceRange.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, bottom: 5),
                child: HeaderTitleWidget(title: AppTexts.apply, showDivider: false),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: SfRangeSliderTheme(
                  data: SfRangeSliderThemeData(
                    activeTrackHeight: 4,
                    inactiveTrackHeight: 2,
                    tooltipBackgroundColor: AppColors.primary,
                  ),
                  child: SfRangeSlider(
                    min: min,
                    max: max,
                    activeColor: AppColors.primary,
                    inactiveColor: Colors.grey.shade300,
                    showLabels: true,
                    enableTooltip: true,
                    tooltipShape: SfPaddleTooltipShape(),
                    values: range,
                    numberFormat: NumberFormat("\$"),
                    onChanged: filController.onRangeChanged,
                    onChangeEnd: filController.onRangeChangeEnd,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16, bottom: 5),
                child: HeaderTitleWidget(title: AppTexts.categoriesSelected, showDivider: false),
              ),
              Obx(() {
                final selected = filController.selectedCategoryId.toList();
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
                          onRemove: () => filController.toggleCategory(id, false),
                        ),
                      AddToCategoryButtonWidget(),
                    ],
                  ),
                );
              }),
            ],
          );
        }),
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBarWidget(
          item: dummyProduct,
          title: '${AppTexts.showResults}(${filController.filteredProducts.length})',
          showIcon: false,
          addToCart: null,
          router: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductsDisplayPage(items: filController.filteredProducts, title: AppTexts.filteredProducts,)),
            );
          },
        ),
      ),
    );
  }

  String _nameFor(CategoryController categoryController, int id) {
    final c = categoryController.categories.firstWhereOrNull((e) => e.id == id);
    return c!.name;
  }
}
