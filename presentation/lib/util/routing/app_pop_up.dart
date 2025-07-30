import 'package:flutter/material.dart';

import '../../pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import '../../view/product_view_model.dart';

class AppPopUp {
  static Future<T?> showBottomSheet<T>(BuildContext context, {required ProductViewModel item}) {
    return showModalBottomSheet<T>(
      backgroundColor: Colors.white,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      context: context,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          children: [Expanded(child: ProductDetailAddToCartBottomSheetWidget(item: item))],
        ),
      ),
    );
  }
}
