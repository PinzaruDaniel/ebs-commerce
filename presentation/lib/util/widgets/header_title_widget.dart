import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../pages/products_display_page/products_display_controller.dart';

class HeaderTitleViewModel extends BaseViewModel {
  final String title;
  final bool showDivider;
  final bool showSeeAll;
  final ProductListType? type;

  HeaderTitleViewModel({required this.title,  this.showDivider=true, this.showSeeAll=false, this.type});
}

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({super.key, required this.itemViewModel});
  final HeaderTitleViewModel itemViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(itemViewModel.title, style: AppTextsStyle.bold(size: 11)),
            Spacer(),
            if (itemViewModel.showSeeAll)
              TextButton(
                onPressed: () {
                  AppRouter.openProductsDisplayPage(type: itemViewModel.type!, title: itemViewModel.title);
                },
                child: Text(AppTexts.seeAll, style: AppTextsStyle.bold(size: 11, color: AppColors.primary)),
              ),
          ],
        ),
        if (itemViewModel.showDivider)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.all(Radius.circular(3))),
            ),
          ),
      ],
    );
  }
}
