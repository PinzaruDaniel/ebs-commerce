import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import '../../controllers/controller_imports.dart';
import '../../pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import '../../view/product_view_model.dart';
import '../../view/promo_code_view_model.dart';
import '../resources/app_colors.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        context: Get.context!,
        builder: (_) => child,
      );
    }
  }

  static Future<void> showCartInfoPopUp({
    required ProductViewModel item,
  }) async {
    return showCustomBottomSheet(
      child: ProductDetailAddToCartBottomSheetWidget(item: item),
    );
  }

  static Future<void> paymentMethod({
    required RxString selectedMethod,
    required Function(String) onSelected,
  }) async {
    if (Get.context == null) return;

    final methods = ['PayPal', 'Plata Numerar'];

    await showCustomBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Choose Payment Method',
              style: AppTextsStyle.bold(size: 18),
            ),
          ),
          Obx(() {
            final selected = selectedMethod.value;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40,
              ),
              child: Column(
                children: methods.map((option) {
                  final isSelected = selected == option;
                  return InkWell(
                    onTap: () {
                      onSelected(option);
                      checkoutController.initAllItems();
                      Navigator.pop(Get.context!);
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 36,
                          top: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                option,
                                style: AppTextsStyle.medium.copyWith(
                                  color: isSelected
                                      ? AppColors.primary
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
          BottomNavigationBarWidget(
            title: 'Save',
            onTap: () {
              checkoutController.initAllItems();
              Navigator.pop(Get.context!);
            },
            showIcon: false,
          ),
        ],
      ),
    );
  }

  static Future<void> voucherCode({required RxString voucherCode}) async {
    if (Get.context != null) {
      final viewModel = TextFieldViewModel(
        title: '',
        initialValue: voucherCode.value,
      );
      final promoCodeViewModel = PromoCodeViewModel();
      final validCodes = promoCodeViewModel.getMockPromoCodes();

      await showCustomBottomSheet(
        isScrollControlled: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,

              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          'Enter Voucher Code',
                          style: AppTextsStyle.bold(size: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 24),
                        child: TextFieldWidget(itemViewModel: viewModel),
                      ),
                      BottomNavigationBarWidget(
                        title: 'Save',
                        onTap: () {
                          final enteredCode = viewModel.placeholder.trim().toUpperCase();
                          if (validCodes.contains(enteredCode)) {
                            voucherCode.value = enteredCode;
                            checkoutController.initAllItems();
                            Get.back();
                            Get.snackbar(
                              "Success",
                              "Promo code applied!",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else {
                            Get.snackbar(
                              "Invalid Code",
                              "Promo code not recognized.",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                            );
                          }
                        },
                        showIcon: false,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
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
      return await showCustomBottomSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                    .map(
                      (opt) => Center(
                        child: Text(
                          opt,
                          style: AppTextsStyle.medium.copyWith(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
