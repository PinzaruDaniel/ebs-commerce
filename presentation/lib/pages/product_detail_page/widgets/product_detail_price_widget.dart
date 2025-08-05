import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPriceWidget extends StatefulWidget {
  const ProductDetailPriceWidget({
    super.key,
    required this.item,
    required this.showDiscount,
  });

  final ProductViewModel item;
  final bool showDiscount;

  @override
  State<ProductDetailPriceWidget> createState() =>
      _ProductDetailPriceWidgetState();
}

class _ProductDetailPriceWidgetState extends State<ProductDetailPriceWidget> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          (widget.item.sale == 0 || !widget.showDiscount)
              ? Text(
            '\$ ${widget.item.price ?? '-'}',
            style: AppTextsStyle.bold(size: 21),
          )
              : Row(
            children: [
              Text(
                '\$',
                style: AppTextsStyle.bold(size: 21),
              ),
              const SizedBox(width: 8),
              Text(
                '\$ ${widget.item.price}',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Color(0xffA0A5AB),
                  color: Color(0xffA0A5AB),
                  fontSize: 12,
                  fontFamily: 'Nunito-Sans',
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 3, horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.pinkBackGround,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${widget.item.sale}%',
                  style: AppTextsStyle.bold(size: 11, color: AppColors.redText)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
