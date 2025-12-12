import 'package:flutter/material.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
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
    List<ProductViewModel> products = [];
    //products = productsDisplayController.products;
    /*if (productType case ProductListType.newProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.saleProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.filteredProducts) {
      products = productsDisplayController.products;
    } else if (productType case ProductListType.allProducts) {
      products = productsDisplayController.products;
    }*/
    return ProductsListDisplayWidget(title: title, products: products, showHeaderTitle: false);
  }
}
