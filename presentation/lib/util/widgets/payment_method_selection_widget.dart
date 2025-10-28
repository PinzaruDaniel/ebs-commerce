import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/payment_method_view_model.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';

class PaymentMethodSelectionWidget extends StatefulWidget {
  final PaymentMethodViewModel? initialMethod;
  final Function(PaymentMethodViewModel)? onSelected;

  const PaymentMethodSelectionWidget({super.key, this.initialMethod, this.onSelected});

  @override
  State<PaymentMethodSelectionWidget> createState() => PaymentMethodSelectionWidgetState();
}

class PaymentMethodSelectionWidgetState extends State<PaymentMethodSelectionWidget> {
  PaymentMethodViewModel? selectedMethod;

  @override
  void initState() {
    super.initState();
    selectedMethod = widget.initialMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(AppTexts.choosePaymentMethod, style: AppTextsStyle.bold(size: 18))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            children: paymentMethods.map((option) {
              final isSelected = selectedMethod?.key == option.key;
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedMethod = option;
                  });
                },
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 8.0, right: 36, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text(
                            option.titleKey,
                            style: AppTextsStyle.medium.copyWith(color: isSelected ? AppColors.primary : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void onSave() {
    if (selectedMethod != null) {
      widget.onSelected?.call(selectedMethod!);
    } else {
      Get.back();
    }
  }
}
