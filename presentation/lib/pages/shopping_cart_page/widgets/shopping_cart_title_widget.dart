import 'package:flutter/material.dart';
import '../../../themes/app_text_styles.dart';
import '../../../view/cart_products_view_model.dart';

class ShoppingCartTitleWidget extends StatelessWidget {
  const ShoppingCartTitleWidget({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final price = item.price != null && item.price!.isNotEmpty
        ? double.parse(item.price!)
        : 0.0;
    final totalPrice=price*item.quantity;
    return Padding(
      padding: const EdgeInsets.only(left:8.0, top:8, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: AppTextsStyle.medium, softWrap: true, maxLines: 3, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 4),
          Text(
            '${item.specification?.title??''} - ${item.specification?.value??''}',
            style: AppTextsStyle.medium.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
          ),
          Text(
            '\$${item.price??0}',
            style: AppTextsStyle.bold.copyWith(fontSize: 14, color: Colors.grey.shade500),
          ),
          SizedBox(height: 4),
          Text(
            'Total: $totalPrice ',
            style: AppTextsStyle.bold.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}


