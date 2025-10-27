import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/enum/enums.dart';
import 'package:presentation/util/widgets/option_picker_widget.dart';
import 'package:presentation/util/widgets/payment_method_selection_widget.dart';
import 'package:presentation/util/widgets/voucher_code_input_widget.dart';

import '../../pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import '../../view/product_view_model.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
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
    bool? addToCart,
    bool? showIcon,
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
          //TODO: to add base_view_widget
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (title != null)
                                  Text(
                                    '${AppTexts.choose} ${title.toLowerCase()}',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (onDone != null)
                                  GestureDetector(
                                    onTap: () {
                                      onDone.call();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: AppColors.primary,
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                                      child: Text(
                                        AppTexts.done,
                                        style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      child,

                      if (onSave != null)
                        BottomNavigationBarWidget(
                          title: barTitle ?? AppTexts.save,
                          onTap: () => onSave.call(),
                          showIcon: showIcon ?? false,
                          addToCart: addToCart,
                        ),
                    ],
                  ),
                ),
              );
            },
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
      addToCart: true,
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

  static Future<void> paymentMethod({required Function(PaymentMethod) onSelected, PaymentMethod? initialMethod}) async {
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
    String? title,
    String? content,
    String? confirmText,
    Function? onSave,
    Function? onCancel,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Text(title ?? AppTexts.confirm),
            content: Text(content ?? AppTexts.areYouSure),
            actions: [
              TextButton(
                onPressed: () {
                  onCancel?.call();
                  Navigator.of(context).pop(false);
                },
                child: Text(AppTexts.cancel),
              ),
              TextButton(
                onPressed: () {
                  onSave?.call();
                  Navigator.of(context).pop(true);
                },
                child: Text(confirmText ?? AppTexts.ok, style: TextStyle(color: AppColors.primary)),
              ),
            ],
          ),
        ) ??
        false;
  }
}
