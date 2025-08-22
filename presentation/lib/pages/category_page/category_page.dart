import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/category_page/widgets/checkbox_category_widget.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/app_bar_icon_shopping_cart_widget.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_text_styles.dart';
import '../../../util/routing/app_router.dart';
import '../../util/resources/app_texts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
        actions: [AppBarIconShoppingCartWidget()],
      ),
      body: categoryController.categories.isEmpty
          ? EmptyWidget()
          : ListView.builder(
              itemCount: categoryController.groupedCategories[null]?.length,
              itemBuilder: (context, index) {
                final parent = categoryController.groupedCategories[null]![index];
                final hasChildren = categoryController.groupedCategories.containsKey(parent.id);
                return Obx(() {
                  final selected = categoryController.getCategorySelectionState(parent.id);
                  return ExpansionTile(
                    shape: Border(),
                    iconColor: hasChildren ? AppColors.primary : Colors.transparent,
                    collapsedIconColor: hasChildren ? Colors.black : Colors.transparent,
                    title: CheckboxCategoryWidget(
                      title: parent.name,
                      textStyle: AppTextsStyle.bold(),
                      selected: selected,
                      onChanged: (v) {
                        categoryController.toggleCategoryRecursive(parent.id, v ?? false);
                        if (hasChildren && v == true) {
                          for (var child in categoryController.groupedCategories[parent.id]!) {
                            categoryController.toggleCategory(child.id, true);
                            if (categoryController.groupedCategories.containsKey(child.id)) {
                              for (var grand in categoryController.groupedCategories[child.id]!) {
                                categoryController.toggleCategory(grand.id, true);
                              }
                            }
                          }
                        }
                      },
                    ),
                    children: hasChildren
                        ? List.generate(categoryController.groupedCategories[parent.id]!.length, (childIndex) {
                            final child = categoryController.groupedCategories[parent.id]![childIndex];
                            final hasGrandChildren = categoryController.groupedCategories.containsKey(child.id);
                            final selectedChild = categoryController.getCategorySelectionState(child.id);
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
                                          categoryController.toggleCategoryRecursive(child.id, v ?? false);
                                          if (hasGrandChildren && v == true) {
                                            for (var grand in categoryController.groupedCategories[child.id]!) {
                                              categoryController.toggleCategory(grand.id, true);
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                    children: List.generate(categoryController.groupedCategories[child.id]!.length, (
                                      grandIndex,
                                    ) {
                                      final grand = categoryController.groupedCategories[child.id]![grandIndex];
                                      final selectedGrand = categoryController.selectedCategoryId.contains(grand.id);
                                      return ListTile(
                                        shape: Border(),
                                        title: Padding(
                                          padding: const EdgeInsets.only(left: 32.0),
                                          child: CheckboxCategoryWidget(
                                            title: grand.name,
                                            textStyle: AppTextsStyle.medium.copyWith(fontSize: 12),
                                            selected: selectedGrand,
                                            onChanged: (v) => categoryController.toggleCategory(grand.id, v ?? false),
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
                                        onChanged: (v) => categoryController.toggleCategory(child.id, v ?? false),
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
