import '../../view/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import '../../../util/resources/app_colors.dart';

class CheckoutInfoContainerViewModel extends BaseViewModel {
  final Map<String, dynamic>? infoItems;
  final String? titleKey;
  final VoidCallback? onTap;

  CheckoutInfoContainerViewModel({this.infoItems, this.titleKey, this.onTap});
}

class CheckoutInfoContainerWidget extends StatelessWidget {
  final CheckoutInfoContainerViewModel item;

  const CheckoutInfoContainerWidget({super.key, required this.item});

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
                  onTap: item.onTap,
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
                              children: [
                                if (item.titleKey != null && item.titleKey!.trim().isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Text(item.titleKey.toString(), style: AppTextsStyle.bold(size: 14)),
                                  ),
                                if (item.infoItems != null && item.infoItems!.isNotEmpty)
                                  ...item.infoItems!.entries.map((entry) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [Text(entry.key)],
                                      ),
                                    );
                                  }),
                                if ((item.infoItems == null || item.infoItems!.isEmpty) &&
                                    (item.titleKey?.trim().isEmpty ?? true))
                                  Text('Enter your data here'),
                              ],
                            ),
                          ),
                          Column(
                            children: [Transform.flip(flipX: true, child: AppIcons.backIcon(color: AppColors.blue))],
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
