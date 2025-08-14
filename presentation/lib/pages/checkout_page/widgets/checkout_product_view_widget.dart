import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/resources/app_text_styles.dart';
import '../../../util/widgets/product_image_widget.dart';
import '../../../view/cart_products_view_model.dart';

class CheckoutProductViewModel extends BaseViewModel {}

class CheckoutProductViewWidget extends StatefulWidget {
  const CheckoutProductViewWidget({super.key, required this.item});

  final CartViewModel item;

  @override
  State<CheckoutProductViewWidget> createState() => _CheckoutProductViewWidgetState();
}


class _CheckoutProductViewWidgetState extends State<CheckoutProductViewWidget> {


  @override
  Widget build(BuildContext context) {

    final priceString = (widget.item.discountedPrice != null) ? widget.item.discountedPrice : widget.item.price;
    final price = double.tryParse(priceString ?? '') ?? 0.0;
    final rawTotalPrice = price * widget.item.quantity;
    final totalPrice = double.tryParse(rawTotalPrice.toStringAsFixed(2));


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: ProductImageWidget(
              height: 64,
              width: 64,
              imageUrl: widget.item.imageUrl != null && widget.item.imageUrl!.isNotEmpty ? widget.item.imageUrl : null,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: AppTextsStyle.medium,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${widget.item.specification?.title ?? ''}  ${widget.item.specification?.value ?? ''}',
                    style: AppTextsStyle.medium.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text('\$$price x ${widget.item.quantity}', style: AppTextsStyle.medium),
                      Spacer(),
                      Text('\$$totalPrice ', style: AppTextsStyle.medium),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
