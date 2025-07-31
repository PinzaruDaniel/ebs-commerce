import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:get/get.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';
import '../../../util/routing/app_router.dart';
import '../filter_controller.dart';
import 'category_controller.dart';

class CategoryPickerPage extends StatefulWidget {
  const CategoryPickerPage({super.key});

  @override
  State<CategoryPickerPage> createState() => _CategoryPickerPageState();
}

class _CategoryPickerPageState extends State<CategoryPickerPage> {
  @override
  Widget build(BuildContext context) {
    final categories = categoryController.categories;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        shape: Border(bottom: BorderSide(color: Colors.black12)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('Categories', style: AppTextsStyle.bold),
        actions: [
          IconButton(
            onPressed: () {
              AppRouter.openShoppingCartPage();
            },
            icon: SvgPicture.asset('assets/icons/Cart icon.svg'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, i) {
          final category = categories[i];
          return Obx(() {
            final selected = filterController.selectedCategoryId.contains(category.id);
            return Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  side: BorderSide(color: Colors.grey.shade300, width: 2),
                  value: selected,
                  onChanged: (v) => filterController.toggleCategory(category.id, v ?? false),
                  activeColor: AppColors.primary,
                ),
                Text(category.name, style: AppTextsStyle.bold),
              ],
            );
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(item:dummyProduct,  title: 'Apply', showIcon: false,router: Get.back, addToCart: null,),
    );
  }
}
