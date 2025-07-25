import 'package:presentation/themes/app_text_styles.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailTitleWidget extends StatefulWidget {
  const ProductDetailTitleWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailTitleWidget> createState() => _ProductDetailTitleWidgetState();
}

class _ProductDetailTitleWidgetState extends State<ProductDetailTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.item.company ?? '', style: AppTextsStyle.boldSmall),
              Text(widget.item.title, style: AppTextsStyle.bold),
            ],
          ),
        ),
      ],
    );
  }
}
