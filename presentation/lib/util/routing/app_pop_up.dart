import 'package:common/constants/failure_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:presentation/util/widgets/base/base_view_widget.dart';
import 'package:presentation/util/widgets/option_picker_widget.dart';
import 'package:presentation/util/widgets/payment_method_selection_widget.dart';
import 'package:presentation/util/widgets/voucher_code_input_widget.dart';
import '../../pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import '../../view/payment_method_view_model.dart';
import '../../view/product_view_model.dart';
import '../resources/app_colors.dart';
import '../resources/app_texts.dart';
import '../widgets/selection_widget.dart';

class AppPopUp {
  static Future<void> showCustomBottomSheet<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showHandle = true,
    bool isScrollControlled = false,
    Widget? saveButton,
    Function? onDone,
    String? title,
    Function? onSave,
    bool showIcon = false,
    Color? buttonColor,
    Color? textColor,
    String? barTitle,
  }) async {
    if (Get.context != null) {
      return await showModalBottomSheet(
        backgroundColor: Colors.white,
        showDragHandle: showHandle,
        isDismissible: isDismissible,
        isScrollControlled: true,
        enableDrag: enableDrag,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        context: Get.context!,
        builder: (_) {
          return BaseViewWidget(
            saveButton: saveButton,
            onDone: onDone,
            onSave: onSave,
            title: title,
            showIcon: showIcon,
            buttonColor: buttonColor,
            textColor: textColor,
            barTitle: barTitle,
            child: child,
          );
        },
      );
    }
  }

  static Future<void> showCartInfoPopUp({
    required ProductViewModel item,
    required Function onAdd,
    required int? maxValue,
  }) async {
    final productDetailKey = GlobalKey<ProductDetailAddToCartBottomSheetWidgetState>();
    return await showCustomBottomSheet(
      barTitle: AppTexts.addToCart,
      showIcon: true,
      onSave: () {
        productDetailKey.currentState?.onSave();
      },
      child: ProductDetailAddToCartBottomSheetWidget(
        key: productDetailKey,
        item: item,
        onAdd: onAdd,
        maxValue: maxValue,
      ),
    );
  }

  static Future<void> paymentMethod({
    required Function(PaymentMethodViewModel) onSelected,
    PaymentMethodViewModel? initialMethod,
  }) async {
    final paymentMethodWidgetKey = GlobalKey<PaymentMethodSelectionWidgetState>();
    return await showCustomBottomSheet(
      onSave: () {
        paymentMethodWidgetKey.currentState?.onSave();
      },
      child: PaymentMethodSelectionWidget(
        key: paymentMethodWidgetKey,
        onSelected: onSelected,
        initialMethod: initialMethod,
      ),
    );
  }

  static Future<void> voucherCode({required String initialValue, required Function(String) onSubmit}) async {
    final voucherCodeKey = GlobalKey<VoucherCodeInputWidgetState>();

    return await showCustomBottomSheet(
      isScrollControlled: true,
      onSave: () {
        voucherCodeKey.currentState?.onDone();
      },
      child: VoucherCodeInputWidget(key: voucherCodeKey, initialValue: initialValue, onSubmit: onSubmit),
    );
  }

  static Future<void> showSelection({
    required String title,
    required SelectionViewModel selectionViewModel,
    required Function() onSelect,
  }) async {
    final optionPickerKey = GlobalKey<OptionPickerWidgetState>();
    return await showCustomBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      title: title,
      onDone: () {
        optionPickerKey.currentState?.onDone();
      },
      child: OptionPickerWidget(
        title: title,
        selectionViewModel: selectionViewModel,
        onSelect: onSelect,
        key: optionPickerKey,
      ),
    );
  }

  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    bool barrierDismissible = true,
    bool showCancelButton = true,

    String? title,
    String? content,
    String? confirmText,
    Function? onSave,
    Function? onCancel,
  }) async {
    return await showDialog<bool>(
          barrierDismissible: barrierDismissible,
          context: context,
          builder: (context) => PopScope(
            canPop: barrierDismissible,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text(title ?? AppTexts.confirm),
              content: Text(content ?? AppTexts.areYouSure),
              actions: [
                showCancelButton
                    ? TextButton(
                        onPressed: () {
                          onCancel?.call();
                          Navigator.of(context).pop(false);
                        },
                        child: Text(AppTexts.cancel, style: TextStyle(color: AppColors.greyText)),
                      )
                    : SizedBox.shrink(),
                TextButton(
                  onPressed: () {
                    onSave?.call();
                    Navigator.of(context).pop(true);
                  },
                  child: Text(confirmText ?? AppTexts.ok, style: TextStyle(color: AppColors.primary)),
                ),
              ],
            ),
          ),
        ) ??
        false;
  }

  static void showFailureSnackBar({
    String? fallbackMessage,
    String? title,
    bool isError = true,
    SnackPosition? snackPosition,
  }) {
    fallbackMessage;
    if (Get.context != null) {
      Get.snackbar(
        title ?? AppTexts.error,
        fallbackMessage??'',
        backgroundColor: isError ? AppColors.red : AppColors.primary,
        colorText: Colors.white,
        snackPosition: snackPosition ?? SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 70),
        padding: const EdgeInsets.all(16),
        borderRadius: 20,
        icon: Icon(isError ? Icons.error : Icons.check_circle, color: Colors.white),
      );
    }
  }
}
