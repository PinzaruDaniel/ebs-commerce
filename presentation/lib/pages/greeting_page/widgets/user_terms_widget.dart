import 'package:flutter/material.dart';

import '../../../util/resources/app_colors.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../util/resources/app_texts.dart';
import '../../../util/widgets/select_checkbox_widget.dart';

class UserTermsWidget extends StatelessWidget {
  final Function onTap;
  final Function(bool) onChanged;
  final bool hasAgreed;

  const UserTermsWidget({super.key, required this.onTap, required this.onChanged, required this.hasAgreed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0, left: 24, right: 24),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          onTap.call();
        },
        child: SelectCheckboxWidget(
          title: AppTexts.agreeUserTerms,
          selected: hasAgreed,
          selectedColor: Colors.black,
          tristate: false,
          onChanged: (value) {
            onChanged(value!);
          },
          textStyle: AppTextsStyle.medium.copyWith(color: AppColors.greyText, fontSize: 16),
        ),
      ),
    );
  }
}
