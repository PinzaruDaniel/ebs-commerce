import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import '../../view/product_view_model.dart';

class AppPopUp {
  static Future<void> showCustomBottomSheet({
    required Widget child,
    double heightFraction = 0.35,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showHandle = true,
  }) async {
    if (Get.context != null) {
      return await showModalBottomSheet(
        backgroundColor: Colors.white,
        showDragHandle: showHandle,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        context: Get.context!,
        builder: (_) => SizedBox(
          height: Get.height * heightFraction,
          child: child,
        ),
      );
    }
  }
  static Future<void> showCartInfoPopUp({required ProductViewModel item}) async {
    return showCustomBottomSheet(
      child: ProductDetailAddToCartBottomSheetWidget(item: item),
    );
  }

  static Future<void>paymentMethod()async{
    if(Get.context!=null) {
      return await showModalBottomSheet(
        backgroundColor: Colors.white,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        context: Get.context!,
        builder: (_) =>
            SizedBox(
              height: Get.height * 0.35,
              child: Column(
                children: [

                  Expanded(child: Text('Hello'))
                ],
              ),
            ),
      );
    }
  }

}
