import 'package:presentation/themes/app_colors.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:presentation/themes/app_text_styles.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailTagsWidget extends StatelessWidget {
  const ProductDetailTagsWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(title: 'MARKS', showDivider: false),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (item.marks ?? []).map((tag) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.primary),
                child: Text(tag, style: AppTextsStyle.medium.copyWith(color: Colors.white)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
