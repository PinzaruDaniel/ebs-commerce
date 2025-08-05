import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

import '../../../util/resources/app_text_styles.dart';

class ProductDetailSpecificationWidget extends StatefulWidget {
  const ProductDetailSpecificationWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailSpecificationWidget> createState() => _ProductDetailSpecificationWidgetState();
}

class _ProductDetailSpecificationWidgetState extends State<ProductDetailSpecificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(title: AppTexts.productsSpecifications, showDivider: false),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.item.specification.length,
            padding: EdgeInsets.symmetric(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 8),
            itemBuilder: (context, index) {
              final spec = widget.item.specification[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    child: Text(
                      spec.title,
                      style: AppTextsStyle.bold(size: 14),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  Expanded(child: Text(spec.value)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
