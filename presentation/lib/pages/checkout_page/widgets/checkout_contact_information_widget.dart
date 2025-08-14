import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';

import 'package:presentation/pages/contact_information_page/contact_information_page.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/widgets/checkout_info_card_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/resources/app_colors.dart';
import '../../../util/routing/app_router.dart';

class CheckoutContactInformationVieModel extends BaseViewModel {
  final Map<String, dynamic>? infoItems;
  final String? titleKey;

  CheckoutContactInformationVieModel({ required this.infoItems, this.titleKey});
}

class CheckoutContactInformationWidget extends StatelessWidget {
  final CheckoutContactInformationVieModel item;
  final VoidCallback? onTap;


  const CheckoutContactInformationWidget({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.titleKey != null && item.titleKey!.isNotEmpty)
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
                          children: [
                            Text('${entry.key}:'),
                            Expanded(child: Text(entry.value ?? '')),
                          ],
                        ),
                      );
                    }),
                  if (item.infoItems == null || item.infoItems!.isEmpty) Text('Enter your data here'),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

/*CheckoutInfoCardWidget(
          router: () {
          },
          content:
              (user == null || (user.name.isEmpty && user.surname.isEmpty && user.number.isEmpty && user.email.isEmpty))
              ? Text('Enter here your data')
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${user.name} ${user.surname}', style: AppTextsStyle.bold(size: 14),),
                  SizedBox(height: 4),
                  Text(user.number),
                  SizedBox(height: 2),
                  Text(user.email),
                ],
              ),
        );*/
