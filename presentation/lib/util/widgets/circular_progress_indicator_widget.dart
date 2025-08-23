import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  final double? value;
  final BoxConstraints boxConstraints;
  final double? heightFactor;
  const CircularProgressIndicatorWidget({super.key, required this.boxConstraints, this.heightFactor, this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: heightFactor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              value: value,
              color: AppColors.primary,
              strokeWidth: 3,
              constraints: boxConstraints,
            ),
          ],
      ),
    );
  }
}
