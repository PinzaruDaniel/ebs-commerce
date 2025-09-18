import 'package:common/constants/constant_lists_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';
import 'bottom_navigation_bar_widget.dart';

class PaymentMethodSelectionWidget extends StatefulWidget {
  final String? initialMethod;

  final Function(String)? onSelected;

  const PaymentMethodSelectionWidget({
    super.key,
    this.initialMethod,
    this.onSelected,
  });

  @override
  State<PaymentMethodSelectionWidget> createState() => _PaymentMethodSelectionWidgetState();
}

class _PaymentMethodSelectionWidgetState extends State<PaymentMethodSelectionWidget> {
  String? selectedMethod;
  @override
  void initState() {
    super.initState();
    selectedMethod = widget.initialMethod; // 👈 prefill
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppTexts.choosePaymentMethod,
            style: AppTextsStyle.bold(size: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            children: paymentMethods.map((option) {
              final isSelected = selectedMethod == option;
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
        ),
        BottomNavigationBarWidget(
          title: AppTexts.save,
          onTap: () {
            if (selectedMethod != null) {
              widget.onSelected?.call(selectedMethod!);
            } else {
              Get.back();
            }
          },
          showIcon: false,
        ),
      ],
    );
  }
}