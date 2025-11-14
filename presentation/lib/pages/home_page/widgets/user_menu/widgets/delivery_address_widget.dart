import 'package:flutter/material.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../../../../util/resources/app_text_styles.dart';
import '../../../../../util/resources/app_texts.dart';

class DeliveryAddressWidget extends StatelessWidget {
  final UserViewModel? userVm;
  const DeliveryAddressWidget({super.key, required this.userVm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppTexts.address}:',
            style: AppTextsStyle.bold(size: 14, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            '${userVm?.deliveryAddressViewModel?.country ?? ''}, ${userVm?.deliveryAddressViewModel?.city ?? ''} ',
            style: AppTextsStyle.medium.copyWith(color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            userVm?.deliveryAddressViewModel?.address ?? '',
            style: AppTextsStyle.medium.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
