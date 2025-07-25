import 'package:presentation/pages/product_detail_page/widgets/product_detail_description_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_price_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_specification_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_tags_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_title_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPageBodyWidget extends StatefulWidget {
  const ProductDetailPageBodyWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailPageBodyWidget> createState() => _ProductDetailPageBodyWidgetState();
}

class _ProductDetailPageBodyWidgetState extends State<ProductDetailPageBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailTitleWidget(item: widget.item),

          ProductDetailPriceWidget(item: widget.item, showDiscount: true),

          ProductDetailTagsWidget(item: widget.item),

          ProductDetailDescriptionWidget(item: widget.item),

          ProductDetailSpecificationWidget(item: widget.item),
        ],
      ),
    );
  }
}
