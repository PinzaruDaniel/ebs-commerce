import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/filtered_page/filter_controller.dart';
import 'package:presentation/themes/app_colors.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../themes/app_text_styles.dart';
import 'package:get/get.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool _isFilterSelected = false;

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
      body: Obx(() {
        final min = filterController.minPrice.value;
        final max = filterController.maxPrice.value;
        final range = filterController.priceRange.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, bottom: 5),
              child: HeaderTitleWidget(title: 'Price', showDivider: false),
            ),

            Container(
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
                  onChanged: filterController.onRangeChanged,
                  onChangeEnd: filterController.onRangeChangeEnd,
                ),
              ),
            ),
            Text('$range'),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, bottom: 5),
              child: HeaderTitleWidget(title: 'Categories selected', showDivider: false),
            ),


          ],
        );
      }),
    );
  }
}
