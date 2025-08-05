import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../util/resources/app_text_styles.dart';
import '../../product_detail_price_widget.dart';

class AddToCartPopUpTitleWidget extends StatefulWidget {
  const AddToCartPopUpTitleWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<AddToCartPopUpTitleWidget> createState() => _AddToCartPopUpTitleWidgetState();
}

class _AddToCartPopUpTitleWidgetState extends State<AddToCartPopUpTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 4),
            child: RichText(
              text: TextSpan(
                style: AppTextsStyle.bold(),
                children: [
                  TextSpan(
                    text: widget.item.company?[AppTexts.brand] != null
                        ? '${widget.item.title} From ${widget.item.company?[AppTexts.brand] as String? ?? ''}'
                        : widget.item.title,
                  ),
                  if (widget.item.sale! > 0)
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                        decoration: BoxDecoration(color: AppColors.pinkBackGround, borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '${widget.item.sale}%',
                          style: AppTextsStyle.bold(size: 11, color: AppColors.redText),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          ProductDetailPriceWidget(item: widget.item, showDiscount: false),
        ],
      ),
    );
  }
}
