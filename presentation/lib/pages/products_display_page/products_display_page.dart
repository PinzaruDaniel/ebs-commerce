import 'package:flutter/material.dart';
import 'package:presentation/pages/products_display_page/widgets/products_display_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';

import '../../util/resources/app_icons.dart';
import '../../util/routing/app_router.dart';
import '../../view/base_view_model.dart';

class FilteredProductsPage extends StatefulWidget {
  final String title;
  final AllProductsViewItem item;
  const FilteredProductsPage({super.key, required this.title, required this.item});

  @override
  State<FilteredProductsPage> createState() => _FilteredProductsPageState();
}

class _FilteredProductsPageState extends State<FilteredProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBorder: true, iconColors: AppColors.blue,
        title: widget.title,
        actions: [IconButton(onPressed: AppRouter.openShoppingCartPage, icon: AppIcons.cartIcon)],
      ),
      body: SingleChildScrollView(child: ProductsDisplayPage(item: widget.item, title: widget.title, showHeaderTitle: false,)),
    );
  }
}
