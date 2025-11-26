import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../../util/enum/enums.dart';

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
    /*List<ProductViewModel> products = [];
    if (productType case ProductListType.newProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.saleProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.filteredProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.allProducts) {
      products = productsDisplayController.products;
    }*/
    return Builder(
      builder: (context) {
        return ProductsListDisplayWidget(
          products: productsDisplayController.products,
          title: title,
          showHeaderTitle: false,
        );
      },
    );
  }
}
