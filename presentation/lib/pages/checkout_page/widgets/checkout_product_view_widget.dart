import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/resources/app_text_styles.dart';
import '../../../util/widgets/product_image_widget.dart';
import '../../../view/cart_products_view_model.dart';

class CheckoutProductViewModel extends BaseViewModel {
}

class CheckoutProductViewWidget extends StatelessWidget {
  const CheckoutProductViewWidget({super.key, required this.item});

  final CartViewModel item;

  @override
  Widget build(BuildContext context) {
    final priceString = (item.discountedPrice != null) ?item.discountedPrice : item.price;
    final price = double.tryParse(priceString ?? '') ?? 0.0;
    final rawTotalPrice = price *item.quantity;
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
              imageUrl: item.imageUrl != null && item.imageUrl!.isNotEmpty ? item.imageUrl : null,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: AppTextsStyle.medium, softWrap: true, maxLines: 3, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4),
                  Text(
                    '${item.specification?.title ?? ''}  ${item.specification?.value ?? ''}',
                    style: AppTextsStyle.medium.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text('\$$price x ${item.quantity}', style: AppTextsStyle.medium),
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
