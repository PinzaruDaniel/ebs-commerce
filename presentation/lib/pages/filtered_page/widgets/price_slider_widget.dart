// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../util/resources/app_colors.dart';

class PriceSliderWidget extends StatelessWidget {
  final Function(SfRangeValues) onRangeChanged;
  final Function(SfRangeValues) onRangeChangeEnd;
  final SfRangeValues range;
  final double min;
  final double max;

  const PriceSliderWidget({
    super.key,
    required this.onRangeChanged,
    required this.onRangeChangeEnd,
    required this.min,
    required this.max, required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: SfRangeSliderTheme(
        data: SfRangeSliderThemeData(
          activeTrackHeight: 4,
          inactiveTrackHeight: 2,
          tooltipBackgroundColor: AppColors.primary,
        ),
        child: SfRangeSlider(
          min: min,
          max: max,
          activeColor: AppColors.primary,
          inactiveColor: Colors.grey.shade300,
          showLabels: true,
          enableTooltip: true,
          tooltipShape: SfPaddleTooltipShape(),
          values: range,
          numberFormat: NumberFormat("\$"),
          onChanged: onRangeChanged,
          onChangeEnd: onRangeChangeEnd,
        ),
      ),
    );
  }
}
