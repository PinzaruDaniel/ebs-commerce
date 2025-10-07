import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../product_detail_price_widget.dart';

class AddToCartPopUpTitleWidget extends StatelessWidget {
  const AddToCartPopUpTitleWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  Widget build(BuildContext context) {
    final brand = item.company?[AppTexts.brand] as String?;
    final titleText = brand != null && brand.isNotEmpty
        ? '${item.title} From $brand'
        : item.title;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 4),
            child: RichText(
              text: TextSpan(
                style: AppTextsStyle.bold(),
                children: [
                  TextSpan(text: titleText),
                  if (item.discount?.isNotEmpty == true )
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.pinkBackGround,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${item.discount}%',
                            style: AppTextsStyle.bold(
                                size: 11, color: AppColors.redText),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              maxLines: null,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          ProductDetailPriceWidget(item: item, showDiscount: false),
        ],
      ),
    );
  }
}