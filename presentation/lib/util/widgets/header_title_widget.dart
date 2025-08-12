import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_router.dart';

import '../../pages/products_display_page/products_display_controller.dart';


class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({super.key, required this.title, this.showDivider, this.showSeeAll,  this.type,});

  final String title;
  final bool? showDivider;
  final bool? showSeeAll;
final ProductListType? type;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(

          children: [
            Text(title, style: AppTextsStyle.bold(size: 11)),
            Spacer(),
            if(showSeeAll == true)
              TextButton(
                onPressed: () {
                  AppRouter.openProductsDisplayPage(type: type!, title: title);
                },
                child: Text(AppTexts.seeAll, style: AppTextsStyle.bold(size: 11, color: AppColors.primary)),
              ),
          ],
        ),
        if (showDivider == true)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                  color: AppColors.secondary,

                  borderRadius: BorderRadius.all(Radius.circular(3))
              ),

            ),
          )
      ],
    );
  }
}
