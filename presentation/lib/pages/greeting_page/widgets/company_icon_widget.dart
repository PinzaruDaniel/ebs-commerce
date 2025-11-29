import 'package:flutter/material.dart';

import '../../../util/resources/app_icons.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../util/resources/app_texts.dart';

class CompanyIconWidget  extends StatelessWidget {
  const CompanyIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcons.ebsIcon,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Text(AppTexts.ebsForWish, style: AppTextsStyle.bold(size: 36), textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
