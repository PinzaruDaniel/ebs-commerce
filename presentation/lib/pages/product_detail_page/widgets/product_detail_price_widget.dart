import 'package:presentation/themes/app_text_styles.dart';
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
            style: AppTextsStyle.bold.copyWith(fontSize: 21),
          )
              : Row(
            children: [
              Text(
                '\$ discountPrice',
                style: AppTextsStyle.bold.copyWith(fontSize: 21),
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
                  color: const Color(0xfff8dcde),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${widget.item.sale}%',
                  style: AppTextsStyle.boldSmall
                      .copyWith(color: const Color(0xffcf1c0c)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
