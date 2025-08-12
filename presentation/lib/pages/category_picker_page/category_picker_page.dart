import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/category_picker_page/widgets/checkbox_category_widget.dart';
import 'package:presentation/pages/filtered_page/filter_controller.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_text_styles.dart';
import '../../../util/routing/app_router.dart';
import '../../util/resources/app_texts.dart';
import 'category_controller.dart';

class CategoryPickerPage extends StatefulWidget {
  const CategoryPickerPage({super.key});

  @override
  State<CategoryPickerPage> createState() => _CategoryPickerPageState();
}

class _CategoryPickerPageState extends State<CategoryPickerPage> {
  CategoryController get catController => Get.find();

  FilterController get filController => Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBorder: true,
        iconColors: AppColors.primary,
        title: AppTexts.categories,
        actions: [IconButton(onPressed: AppRouter.openShoppingCartPage, icon: AppIcons.cartIcon)],
      ),
      body: ListView.builder(
        itemCount: catController.groupedCategories[null]?.length,
        itemBuilder: (context, index) {
          final parent = catController.groupedCategories[null]![index];
          final hasChildren = catController.groupedCategories.containsKey(parent.id);
          return Obx(() {
            final selected = catController.getCategorySelectionState(parent.id);
            return ExpansionTile(
              shape: Border(),
              iconColor: hasChildren ? AppColors.primary : Colors.transparent,
              collapsedIconColor: hasChildren ? Colors.black : Colors.transparent,
              title: CheckboxCategoryWidget(
                title: parent.name,
                textStyle: AppTextsStyle.bold(),
                selected: selected,
                onChanged: (v) {
                  catController.toggleCategoryRecursive(parent.id, v ?? false);
                  if (hasChildren && v == true) {
                    for (var child in catController.groupedCategories[parent.id]!) {
                      catController.toggleCategory(child.id, true);
                      if (catController.groupedCategories.containsKey(child.id)) {
                        for (var grand in catController.groupedCategories[child.id]!) {
                          catController.toggleCategory(grand.id, true);
                        }
                      }
                    }
                  }
                },
              ),
              children: hasChildren
                  ? List.generate(catController.groupedCategories[parent.id]!.length, (childIndex) {
                      final child = catController.groupedCategories[parent.id]![childIndex];
                      final hasGrandChildren = catController.groupedCategories.containsKey(child.id);
                      final selectedChild = catController.getCategorySelectionState(child.id);
                      return hasGrandChildren
                          ? ExpansionTile(
                              shape: Border(),
                              iconColor: AppColors.primary,
                              title: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: CheckboxCategoryWidget(
                                  title: child.name,
                                  textStyle: AppTextsStyle.medium,
                                  selected: selectedChild,
                                  onChanged: (v) {
                                    catController.toggleCategoryRecursive(child.id, v ?? false);
                                    if (hasGrandChildren && v == true) {
                                      for (var grand in catController.groupedCategories[child.id]!) {
                                        catController.toggleCategory(grand.id, true);
                                      }
                                    }
                                  },
                                ),
                              ),
                              children: List.generate(catController.groupedCategories[child.id]!.length, (grandIndex) {
                                final grand = catController.groupedCategories[child.id]![grandIndex];
                                final selectedGrand = catController.selectedCategoryId.contains(grand.id);
                                return ListTile(
                                  shape: Border(),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 32.0),
                                    child: CheckboxCategoryWidget(
                                      title: grand.name,
                                      textStyle: AppTextsStyle.medium.copyWith(fontSize: 12),
                                      selected: selectedGrand,
                                      onChanged: (v) => catController.toggleCategory(grand.id, v ?? false),
                                    ),
                                  ),
                                );
                              }),
                            )
                          : ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: CheckboxCategoryWidget(
                                  title: child.name,
                                  textStyle: AppTextsStyle.medium,
                                  selected: selectedChild,
                                  onChanged: (v) => catController.toggleCategory(child.id, v ?? false),
                                ),
                              ),
                            );
                    })
                  : [],
            );
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        item: dummyProduct,
        title: AppTexts.apply,
        showIcon: false,
        router: Get.back,
        addToCart: null,
      ),
    );
  }
}
