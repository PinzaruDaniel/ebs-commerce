import 'package:flutter/material.dart';

import '../../../util/resources/app_colors.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../util/resources/app_texts.dart';

class ButtonWithoutPasswordWidget extends StatelessWidget {
  final Function onTap;

  const ButtonWithoutPasswordWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          onTap.call();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppTexts.enterWithoutPassword,
            style: AppTextsStyle.medium.copyWith(
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.greyText,
              shadows: [Shadow(color: AppColors.greyText, offset: Offset(0, -2))],
            ),
          ),
        ),
      ),
    );
  }
}
