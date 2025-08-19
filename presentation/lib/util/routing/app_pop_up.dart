import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
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
        builder: (_) =>
            SizedBox(
              height: Get.height * heightFraction,
              child: child,
            ),
      );
    }
  }

  static Future<void> showCartInfoPopUp(
      {required ProductViewModel item}) async {
    return showCustomBottomSheet(
      child: ProductDetailAddToCartBottomSheetWidget(item: item),
    );
  }

  static Future<void> paymentMethod() async {
    if (Get.context != null) {
      return await showModalBottomSheet(
        backgroundColor: Colors.white,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        context: Get.context!,
        builder: (_) =>
            SizedBox(
              height: Get.height * 0.35,
              child: const Column(
                children: [
                  Expanded(child: Text('Hello')),
                ],
              ),
            ),
      );
    }
  }

  static Future<void> showSelection({
    required String title,
    required List<String> options,
    required RxString selectedValue,
    Function(String)? onSelectionChanged,
  }) async {
    if (Get.context != null) {
      return await showModalBottomSheet(
        backgroundColor: Colors.white,
        context: Get.context!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 300,
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
              Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Choose ${title.toLowerCase()}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 32,
                useMagnifier: true,
                magnification: 1.2,
                selectionOverlay: Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
                  scrollController: FixedExtentScrollController(
                    initialItem: options.indexOf(selectedValue.value),
                  ),
                  onSelectedItemChanged: (int index) {
                    selectedValue.value = options[index];
                    if (onSelectionChanged != null) {
                      onSelectionChanged(options[index]);
                    }
                  },
                  children: options
                      .map((opt) =>
                      Center(
                        child: Text(
                          opt,
                          style: AppTextsStyle.medium.copyWith(fontSize: 23),
                        ),
                      ))
                      .toList(),
                ),
              ),
              ],
            ),
          );
        },
      );
    }
  }
}