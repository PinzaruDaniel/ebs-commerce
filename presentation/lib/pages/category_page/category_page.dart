import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/category_page/category_controller.dart';
import 'package:presentation/pages/category_page/widgets/checkbox_category_widget.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_icon_shopping_cart_widget.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/circular_progress_indicator_widget.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_text_styles.dart';
import '../../util/resources/app_texts.dart';
class CategoryPage extends StatefulWidget {
  final Function onSave;

  const CategoryPage({super.key, required this.onSave});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryController get categoryController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(CategoryController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryController.getCategories();
    });
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
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return  Center(
            child: CircularProgressIndicatorWidget(boxConstraints: BoxConstraints(minHeight: 75, minWidth: 75)),
          );
        }

        final parentCategories = categoryController.groupedCategories[null];

        if (parentCategories == null || parentCategories.isEmpty) {
          return  EmptyWidget();
        }

        return ListView.builder(
          itemCount: parentCategories.length,
          itemBuilder: (context, index) {
            final parent = parentCategories[index];
            final hasChildren = categoryController.groupedCategories.containsKey(parent.id);

            return ExpansionTile(
              shape:  Border(),
              iconColor: hasChildren ? AppColors.primary : Colors.transparent,
              collapsedIconColor: hasChildren ? Colors.black : Colors.transparent,
              title: Obx(() {
                final selected = categoryController.getCategorySelectionState(parent.id);
                return CheckboxCategoryWidget(
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
                );
              }),
              children: hasChildren
                  ? List.generate(categoryController.groupedCategories[parent.id]!.length, (childIndex) {
                      final child = categoryController.groupedCategories[parent.id]![childIndex];
                      final hasGrandChildren = categoryController.groupedCategories.containsKey(child.id);

                      return hasGrandChildren
                          ? ExpansionTile(
                              shape:  Border(),
                              iconColor: AppColors.primary,
                              title: Padding(
                                padding:  EdgeInsets.only(left: 16.0),
                                child: Obx(() {
                                  final selectedChild = categoryController.getCategorySelectionState(child.id);
                                  return CheckboxCategoryWidget(
                                    title: child.name,
                                    textStyle: AppTextsStyle.medium,
                                    selected: selectedChild,
                                    onChanged: (v) {
                                      categoryController.toggleCategoryRecursive(child.id, v ?? false);
                                      if (v == true) {
                                        for (var grand in categoryController.groupedCategories[child.id]!) {
                                          categoryController.toggleCategory(grand.id, true);
                                        }
                                      }
                                    },
                                  );
                                }),
                              ),
                              children: List.generate(categoryController.groupedCategories[child.id]!.length, (
                                grandIndex,
                              ) {
                                final grand = categoryController.groupedCategories[child.id]![grandIndex];
                                return ListTile(
                                  shape:  Border(),
                                  title: Padding(
                                    padding:  EdgeInsets.only(left: 32.0),
                                    child: Obx(() {
                                      final selectedGrand = categoryController.selectedCategoryId.contains(grand.id);
                                      return CheckboxCategoryWidget(
                                        title: grand.name,
                                        textStyle: AppTextsStyle.medium.copyWith(fontSize: 12),
                                        selected: selectedGrand,
                                        onChanged: (v) => categoryController.toggleCategory(grand.id, v ?? false),
                                      );
                                    }),
                                  ),
                                );
                              }),
                            )
                          : ListTile(
                              title: Padding(
                                padding:  EdgeInsets.only(left: 16.0),
                                child: Obx(() {
                                  final selectedChild = categoryController.getCategorySelectionState(child.id);
                                  return CheckboxCategoryWidget(
                                    title: child.name,
                                    textStyle: AppTextsStyle.medium,
                                    selected: selectedChild,
                                    onChanged: (v) => categoryController.toggleCategory(child.id, v ?? false),
                                  );
                                }),
                              ),
                            );
                    })
                  : [],
            );
          },
        );
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBarWidget(
          title: categoryController.categories.isEmpty ? AppTexts.goHome : AppTexts.apply,
          showIcon: false,
          onTap: () {
            if (categoryController.categories.isEmpty) {
              AppRouter.openHomePage();
            } else {
              widget.onSave.call(categoryController.categories.toList(), categoryController.selectedCategoryId.toSet());
              Get.back();
            }
          },
          addToCart: null,
        ),
      ),
    );
  }
}
