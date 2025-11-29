import 'package:flutter/material.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/view/product_view_model.dart';

class ProductsListContainer extends StatelessWidget {
  final Widget Function(BuildContext context, List<dynamic> products) builder;
  final List<ProductViewModel> products;

  const ProductsListContainer({super.key, required this.builder, required this.products});

  @override
  Widget build(BuildContext context) {
      if (products.isEmpty) {
        return EmptyWidget();
      }

      return builder(context, products);
  }
}
//