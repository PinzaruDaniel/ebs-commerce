import 'package:flutter/material.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../../../../util/resources/app_text_styles.dart';
import '../../../../../util/resources/app_texts.dart';

class UserInfoWidget extends StatelessWidget {
  final UserViewModel? userVm;
  const UserInfoWidget({super.key, required this.userVm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.personalLabel,
            style: AppTextsStyle.bold(size: 14, color: Colors.white),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Text(
              userVm?.email ?? '',
              style: AppTextsStyle.medium.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '${userVm?.dialCode ?? ''} ${userVm?.number ?? ''} ',
            style: AppTextsStyle.medium.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
