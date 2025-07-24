import 'package:flutter/material.dart';

import '../../../themes/app_text_styles.dart';
import '../../../view/cart_products_view_model.dart';

class ShoppingCartTitleWidget extends StatelessWidget {
  const ShoppingCartTitleWidget({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: AppTextsStyle.medium),
          SizedBox(height: 4),
          Text(
            '${item.specification?.title} - ${item.specification?.value}',
            style: AppTextsStyle.medium.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
          ),
          Text(
            '\$${item.price}',
            style: AppTextsStyle.bold.copyWith(fontSize: 14, color: Colors.grey.shade500),
          ),
          SizedBox(height: 4),
          Text(
            'Total: \${item.price * item.quantity}',
            style: AppTextsStyle.bold.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
