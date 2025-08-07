import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/filtered_page/filter_controller.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/circular_progress_indicator_page_widget.dart';
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
            final selected = filController.selectedCategoryId.contains(parent.id);
            return ExpansionTile(
              shape: Border(),
              iconColor:  hasChildren? AppColors.primary: Colors.transparent,
              collapsedIconColor: hasChildren? Colors.black: Colors.transparent,
              title: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    side: BorderSide(color: Colors.grey.shade300, width: 2),
                    value: selected,
                    onChanged: (v) => filController.toggleCategory(parent.id, v ?? false),
                    activeColor: AppColors.primary,
                  ),
                  Expanded(child: Text(parent.name, style: AppTextsStyle.bold())),
                ],
              ),

              children: hasChildren
                  ? List.generate(catController.groupedCategories[parent.id]!.length, (childIndex) {
                      final child = catController.groupedCategories[parent.id]![childIndex];
                      final hasGrandChildren = catController.groupedCategories.containsKey(child.id);
                      final selectedChild = filController.selectedCategoryId.contains(child.id);
                      return hasGrandChildren
                          ? ExpansionTile(
                              shape: Border(),
                              iconColor: AppColors.primary,
                              title: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                      side: BorderSide(color: Colors.grey.shade300, width: 2),
                                      value: selectedChild,
                                      onChanged: (v) => filController.toggleCategory(child.id, v ?? false),
                                      activeColor: AppColors.primary,
                                    ),
                                    Text(child.name, style: AppTextsStyle.medium),
                                  ],
                                ),
                              ),
                              children: List.generate(catController.groupedCategories[child.id]!.length, (grandIndex) {
                                final grand = catController.groupedCategories[child.id]![grandIndex];
                                final selectedGrand = filController.selectedCategoryId.contains(grand.id);
                                return ListTile(
                                  shape: Border(),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 32.0),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                          side: BorderSide(color: Colors.grey.shade300, width: 2),
                                          value: selectedGrand,
                                          onChanged: (v) => filController.toggleCategory(grand.id, v ?? false),
                                          activeColor: AppColors.primary,
                                        ),
                                        Text(grand.name, style: AppTextsStyle.medium.copyWith(fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            )
                          : ListTile(
                              title: Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    side: BorderSide(color: Colors.grey.shade300, width: 2),
                                    value: selected,
                                    onChanged: (v) => filController.toggleCategory(child.id, v ?? false),
                                    activeColor: AppColors.primary,
                                  ),
                                  Text(child.name, style: AppTextsStyle.medium),
                                ],
                              ),
                            );
                    })
                  : [],
            );
          });
        },
      ),

      /*ListView.builder(
        itemCount: catController.categories.length,
        itemBuilder: (_, i) {
          final category = catController.categories[i];
          return Obx(() {
            final selected = filController.selectedCategoryId.contains(category.id);
            return Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  side: BorderSide(color: Colors.grey.shade300, width: 2),
                  value: selected,
                  onChanged: (v) => filController.toggleCategory(category.id, v ?? false),
                  activeColor: AppColors.primary,
                ),
                Text(
                  '${category.name}  ${category.id}  ${category.level} ${category.parent}',
                  style: AppTextsStyle.bold(),
                ),
              ],
            );
          });
        },
      ),*/
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
