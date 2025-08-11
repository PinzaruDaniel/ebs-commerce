import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:presentation/pages/home_page/home_controller.dart';
import 'package:presentation/pages/products_display_page/products_display_controller.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/view/product_list_type_enum.dart';

import '../../util/resources/app_icons.dart';
import '../../util/routing/app_router.dart';

class ProductsDisplayPage extends StatefulWidget {
  final String title;
  final ProductListType type;

  const ProductsDisplayPage({super.key, required this.title, required this.type});

  @override
  State<ProductsDisplayPage> createState() => _ProductsDisplayPageState();
}

class _ProductsDisplayPageState extends State<ProductsDisplayPage> {
  HomeController get homeController => Get.find();
  ProductsDisplayController get controller => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(ProductsDisplayController(widget.type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBorder: true,
        iconColors: AppColors.blue,
        title: widget.title,
        actions: [IconButton(onPressed: AppRouter.openShoppingCartPage, icon: AppIcons.cartIcon)],
      ),
      body: SingleChildScrollView(
        child: ProductsListDisplayWidget(title: widget.title, showHeaderTitle: false, products: homeController.products,),
      ),
    );
  }
}
