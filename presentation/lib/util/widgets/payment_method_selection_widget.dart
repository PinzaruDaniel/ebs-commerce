import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/controller_imports.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';
import 'bottom_navigation_bar_widget.dart';

class PaymentMethodSelectionWidget extends StatelessWidget {
  final RxString selectedMethod;
  final Function(String) onSelected;
  final List<String> methods;
  const PaymentMethodSelectionWidget({super.key, required this.selectedMethod, required this.onSelected, required this.methods});


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(AppTexts.choosePaymentMethod, style: AppTextsStyle.bold(size: 18))),
        Obx(() {
          final selected = selectedMethod.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              children: methods.map((option) {
                final isSelected = selected == option;
                return InkWell(
                  onTap: () {
                    onSelected(option);
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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              option,
                              style: AppTextsStyle.medium.copyWith(
                                color: isSelected ? AppColors.primary : Colors.black,
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
          title: AppTexts.save,
          onTap: () {
            checkoutController.initAllItems();
            Navigator.pop(Get.context!);
          },
          showIcon: false,
        ),
      ],
    );
  }
}
