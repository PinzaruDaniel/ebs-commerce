import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/widgets/option_picker_widget.dart';
import 'package:presentation/util/widgets/payment_method_selection_widget.dart';
import 'package:presentation/util/widgets/voucher_code_input_widget.dart';
import '../../pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import '../../view/product_view_model.dart';
import '../widgets/text_field_widget.dart';

class AppPopUp {
  static Future<void> showCustomBottomSheet({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showHandle = true,
    bool isScrollControlled = false,
  }) async {
    if (Get.context != null) {
      return await showModalBottomSheet(
        backgroundColor: Colors.white,
        showDragHandle: showHandle,
        isDismissible: isDismissible,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        context: Get.context!,
        builder: (_) => child,
      );
    }
  }

  static Future<void> showCartInfoPopUp({
    required ProductViewModel item,
    required Function onAdd,
    required int? maxValue,
  }) async {
    await showCustomBottomSheet(
      child: ProductDetailAddToCartBottomSheetWidget(item: item, onAdd: onAdd, maxValue: maxValue),
    );
  }

  static Future<void> paymentMethod({required RxString selectedMethod, required Function(String) onSelected}) async {
    if (Get.context == null) return;

    final methods = ['PayPal', 'Plata Numerar'];

    await showCustomBottomSheet(
      child: PaymentMethodSelectionWidget(selectedMethod: selectedMethod, onSelected: onSelected, methods: methods)
    );
  }

  static Future<void> voucherCode({
    required Function()? onTap,
    required TextFieldViewModel textViewModel,
  }) async {
    if (Get.context != null) {
      await showCustomBottomSheet(
        isScrollControlled: true,
        child: VoucherCodeInputWidget(onTap: onTap, textViewModel: textViewModel)
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
      return await showCustomBottomSheet(
        child: OptionPickerWidget(title: title, options: options, selectedValue: selectedValue, onSelectionChanged: onSelectionChanged)
      );
    }
  }
}
