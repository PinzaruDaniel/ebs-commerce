import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../../util/enum/enums.dart';
import '../../../util/widgets/header_title_widget.dart';
import '../../home_page/widgets/home_products_item_widget.dart';

class ProductsListContainer extends StatelessWidget {
  final BuildContext context;
  final String title;
  final ProductListType productType;

  const ProductsListContainer({
    super.key,
    required this.title,
    required this.context,
    this.productType = ProductListType.allProducts,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductViewModel> products = [];
    if (productType case ProductListType.newProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.saleProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.filteredProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.allProducts) {
      products = productsDisplayController.products;
    }
    return ProductsListDisplayWidget(title: title, products: products, showHeaderTitle: false);
  }
}
