import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/themes/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


import '../../themes/app_text_styles.dart';
import 'category_controller.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

SfRangeValues _values = SfRangeValues(40.0, 80.0);
double start = 30.0;
double end = 50.0;

class _FilterPageState extends State<FilterPage> {
  double _value = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        shape: Border(bottom: BorderSide(color: Colors.black12)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('Filters', style: AppTextsStyle.bold),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {},
            child: Text('Reset', style: AppTextsStyle.bold),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          SfSlider(
            min: 2.0,
            max: 10.0,
            activeColor: AppColors.primary,
            inactiveColor: Colors.grey.shade300,
            showLabels: true,
            enableTooltip: true,
            tooltipTextFormatterCallback: (actualValue, formattedText) {
              return 'Value: ${actualValue.toStringAsFixed(1)}';
            },
            value: _value,
            onChanged: (dynamic newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
          SizedBox(height: 20),
          RangeSlider(
            values: RangeValues(start, end),
            labels: RangeLabels(start.toString(), end.toString()),
            onChanged: (value) {
              setState(() {
                start = value.start;
                end = value.end;
              });
            },
            min: 10.0,
            max: 80.0,
          ),
        ],
      ),
    );
  }
}
