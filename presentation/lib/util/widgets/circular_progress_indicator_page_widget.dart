import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class CircularProgressIndicatorPageWidget extends StatelessWidget {
  final BoxConstraints boxConstraints;
  final double? heightFactor;
  const CircularProgressIndicatorPageWidget({super.key, required this.boxConstraints, this.heightFactor});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: heightFactor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 3,
              constraints: boxConstraints,
            ),
            Text('Loading', style: AppTextsStyle.medium.copyWith(color: Colors.grey.shade500)),
          ],
      ),
    );
  }
}
