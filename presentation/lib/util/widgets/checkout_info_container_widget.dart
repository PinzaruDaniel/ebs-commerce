import 'package:presentation/util/enum/enums.dart';

import '../../view/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import '../../../util/resources/app_colors.dart';
import '../resources/app_texts.dart';

class CheckoutInfoContainerViewModel extends BaseViewModel {
  final CheckoutWidgetsType keyId;
  final Map<String, dynamic>? infoItems;
  final String? placeholder;
  final String? titleKey;
  final bool showRemoveButton;
  final bool isPromoValid;

  CheckoutInfoContainerViewModel({
    required this.keyId,
    this.infoItems,
    this.titleKey,
    this.placeholder,

    this.showRemoveButton = false,
    this.isPromoValid = false,
  });
}

class CheckoutInfoContainerWidget extends StatelessWidget {
  final CheckoutInfoContainerViewModel item;

  final Function()? onTap;
  final Function()? onRemoveTap;

  const CheckoutInfoContainerWidget({super.key, required this.item, this.onTap, this.onRemoveTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => onTap?.call(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (item.titleKey != null && item.titleKey!.trim().isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            item.titleKey.toString(),
                                            style: AppTextsStyle.bold(size: 14),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        if (item.isPromoValid)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Icon(Icons.check_circle, color: AppColors.primary, size: 18),
                                          ),
                                      ],
                                    ),
                                  ),
                                if (item.infoItems != null && item.infoItems!.isNotEmpty)
                                  ...item.infoItems!.entries.map((entry) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(entry.key, softWrap: true, overflow: TextOverflow.visible),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                if ((item.infoItems == null || item.infoItems!.isEmpty) &&
                                    (item.titleKey?.trim().isEmpty ?? true))
                                  Text(item.placeholder == null ? AppTexts.enterYourData : item.placeholder!),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              if (item.showRemoveButton)
                                InkWell(
                                  onTap: onRemoveTap,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Remove',
                                      style: AppTextsStyle.bold(size: 12, color: AppColors.redText).copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.redText,
                                        decorationThickness: 1,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                )
                              else
                                Transform.flip(flipX: true, child: AppIcons.backIcon(color: AppColors.blue)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
