import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/base_view_model.dart';

import '../delivery_address_controller.dart';

class DeliveryTypeViewModel extends BaseViewModel {
  final List<String> options;
  final RxString selected;

  DeliveryTypeViewModel({required this.options, String? initial})
    : selected = (initial ?? options.first).obs;
}

class DeliveryTypeWidget extends StatelessWidget {
  const DeliveryTypeWidget({super.key, required this.itemViewModel});

  final DeliveryTypeViewModel itemViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Delivery Type'),
          const SizedBox(height: 4),
          Obx(
            () => Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: itemViewModel.options.map((option) {
                bool isSelected = itemViewModel.selected.value == option;
                return GestureDetector(
                  onTap: () {
                    itemViewModel.selected.value = option;
                    Get.find<DeliveryAddressController>().updateAllItems();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 24,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (option == 'DHL')
                          Image.asset(
                            'assets/icons/dhl.png',
                            width: 40,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        if (option == 'Fan courier')
                          Image.asset(
                            'assets/icons/fan_courier.png',
                            width: 40,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        const SizedBox(width: 8),
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
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
