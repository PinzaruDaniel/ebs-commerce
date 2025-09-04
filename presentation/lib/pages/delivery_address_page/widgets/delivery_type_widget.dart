import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../controllers/controller_imports.dart';
import '../../../util/enum/delivery_type.dart';

class DeliveryOptionViewModel extends BaseViewModel {
  final String titleKey;
  final DeliveryType deliveryType;
  final Image? icon;
  bool isSelected;

  DeliveryOptionViewModel({required this.titleKey, this.icon, required this.isSelected, required this.deliveryType});
}

class DeliveryTypeViewModel extends BaseViewModel {
  final List<DeliveryOptionViewModel> options;

  DeliveryTypeViewModel({required this.options});
  DeliveryOptionViewModel? get selected {
    return options.firstWhereOrNull((option) => option.isSelected);
  }
}

class DeliveryTypeWidget extends StatefulWidget {
  const DeliveryTypeWidget({super.key, required this.itemViewModel});

  final DeliveryTypeViewModel itemViewModel;

  @override
  State<DeliveryTypeWidget> createState() => _DeliveryTypeWidgetState();
}

class _DeliveryTypeWidgetState extends State<DeliveryTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Delivery Type'),
          const SizedBox(height: 4),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.itemViewModel.options.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 3.5,
            ),
            itemBuilder: (context, index) {
              final option = widget.itemViewModel.options[index];
              return InkWell(
                onTap: () {
                  for (var e in widget.itemViewModel.options) {
                    e.isSelected = (e.deliveryType == option.deliveryType);
                  }
                  deliveryAddressController.updateAllItems();
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 36, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: option.isSelected ? AppColors.primary : Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (option.icon != null) option.icon!,
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          option.titleKey,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextsStyle.medium.copyWith(
                            color: option.isSelected ? AppColors.primary : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
