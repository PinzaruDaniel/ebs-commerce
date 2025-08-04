import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/view/product_view_model.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({super.key, required this.title, this.showDivider, this.showSeeAll, this.items});

  final String title;
  final bool? showDivider;
  final bool? showSeeAll;
  final List<ProductViewModel>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: AppTextsStyle.boldSmall),
            Spacer(),
            if(showSeeAll == true)
              TextButton(
                onPressed: () {
                  AppRouter.openProductsDisplayPage(items: items, title: title);
                },
                child: Text(AppTexts.seeAll, style: AppTextsStyle.boldSmall.copyWith(color: AppColors.secondary)),
              ),
          ],
        ),
        if (showDivider == true)
          Divider(thickness: 3, radius: BorderRadiusGeometry.circular(24), color: AppColors.secondary, endIndent: 350),
      ],
    );
  }
}
