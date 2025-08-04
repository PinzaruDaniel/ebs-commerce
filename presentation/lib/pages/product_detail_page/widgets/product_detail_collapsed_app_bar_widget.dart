import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailCollapsedAppBarWidget extends StatefulWidget {
  const ProductDetailCollapsedAppBarWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailCollapsedAppBarWidget> createState() => _ProductDetailCollapsedAppBarWidgetState();
}

class _ProductDetailCollapsedAppBarWidgetState extends State<ProductDetailCollapsedAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(widget.item.title, style: AppTextsStyle.bold)]);
  }
}
