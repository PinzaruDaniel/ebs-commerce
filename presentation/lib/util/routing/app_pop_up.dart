import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import '../../view/product_view_model.dart';

class AppPopUp {

  static Future<void> showBottomSheet({required ProductViewModel item}) async {
    if(Get.context!=null) {
      return await showModalBottomSheet(
        backgroundColor: Colors.white,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        context: Get.context!,
        builder: (_) =>
            Container(
              height: MediaQuery
                  .of(Get.context!)
                  .size
                  .height * 0.35,
              child: Column(
                children: [Expanded(child: ProductDetailAddToCartBottomSheetWidget(item: item))],
              ),
            ),
      );
    }
  }
  static Future<void> showCartInfoPopUp({required ProductViewModel item})async {
    showBottomSheet(item: item);

  }

}
