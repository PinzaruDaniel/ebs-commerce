import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../util/resources/app_text_styles.dart';

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
      padding: const EdgeInsets.only(top: 36, left: 8, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(title: AppTexts.productDescription, showDivider: false),
          SizedBox(height: 12),
          ReadMoreText(
            widget.item.description ?? AppTexts.noDescription,
            trimMode: TrimMode.Length,
            trimLength: 240,
            trimCollapsedText: AppTexts.readMore,
            trimExpandedText: AppTexts.showLess,
            moreStyle: AppTextsStyle.bold.copyWith(color: Color(0xff003bd1), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
