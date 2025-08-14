import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';

import 'package:presentation/pages/contact_information_page/contact_information_page.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/widgets/checkout_info_card_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/resources/app_colors.dart';

class CheckoutContactInformationVieModel extends BaseViewModel {
 final Map<String, dynamic>? infoItems;
 final String? titleKey;

 CheckoutContactInformationVieModel({required this.infoItems, this.titleKey});
}

class CheckoutContactInformationWidget extends StatelessWidget {
  final CheckoutContactInformationVieModel item;

  const CheckoutContactInformationWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Obx(() {
        return

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
      }),
    );
  }
}
