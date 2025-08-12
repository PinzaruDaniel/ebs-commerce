import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';

import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: AppTexts.checkout,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            HeaderTitleWidget(title: AppTexts.orderSummary, showDivider: true,),
            HeaderTitleWidget(title: AppTexts.contactInformation, showDivider: true,),
            HeaderTitleWidget(title: AppTexts.deliveryAddress, showDivider: true,),
            HeaderTitleWidget(title: AppTexts.paymentMethod, showDivider: true,),

          ],
        ),
      )
      
      
    );
  }
}
