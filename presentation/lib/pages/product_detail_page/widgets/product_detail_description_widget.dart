import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../themes/app_text_styles.dart';

class ProductDetailDescriptionWidget extends StatefulWidget {
  const ProductDetailDescriptionWidget({super.key, required this.item});
  final ProductViewModel item;
  @override
  State<ProductDetailDescriptionWidget> createState() => _ProductDetailDescriptionWidgetState();
}

class _ProductDetailDescriptionWidgetState extends State<ProductDetailDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, left:8, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget( title: 'PRODUCT DESCRIPTION', showDivider: false),
          SizedBox(height: 12,),
          ReadMoreText(
            widget.item.description?? 'No description',
            trimMode: TrimMode.Length,
            trimLength: 240,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Show less',
            moreStyle: AppTextsStyle.bold.copyWith(color: Color(0xff003bd1), fontSize: 12),
          ),
          Text('${widget.item.stock}'),
        ],
      ),
    );
  }
}
