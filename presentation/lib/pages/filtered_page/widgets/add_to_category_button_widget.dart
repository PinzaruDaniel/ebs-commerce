import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/filtered_page/filter_controller.dart';
import 'package:presentation/view/category_view_model.dart';

import '../../../util/resources/app_text_styles.dart';
import '../../../util/routing/app_router.dart';

class AddToCategoryButtonWidget extends StatelessWidget {
  const AddToCategoryButtonWidget({super.key});
  FilterController get filterController=>Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () async {
        AppRouter.openCategoryPickerPage(onSave: (List<CategoryViewModel> allCategories, Set<int> selectedIds){
          filterController.setCategoryData(
            selectedIds: selectedIds.toSet(),
            allCategories: allCategories.toList(),
          );
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min ,
          children: [
            Text(
              'Add Category',
              style: AppTextsStyle.medium.copyWith(
                color: Color(0xff6b6d81),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.add, size: 20, color: Color(0xff6b6d81)),
          ],
        ),
      ),
    );
  }
}
