import 'package:flutter/material.dart';
import 'package:presentation/util/enum/map_enums.dart';
import 'package:presentation/util/resources/app_texts.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../view/cart_products_view_model.dart';

class ShoppingCartTitleWidget extends StatelessWidget {
  const ShoppingCartTitleWidget({super.key, required this.item});
  final CartViewModel item;

  @override
  Widget build(BuildContext context) {
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
            '\$${item.unitPrice}',
            style: AppTextsStyle.bold(size: 14, color: Colors.grey.shade500),
          ),
          SizedBox(height: 4),
          Text(
            '${AppTexts.total}: \$${item.totalPrice}',
            style: AppTextsStyle.bold(size: 14),
          ),
        ],
      ),
    );
  }
}


