import 'package:presentation/pages/products_display_page/products_display_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/open_container_animation_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../enum/enums.dart';

class HeaderTitleViewModel extends BaseViewModel {
  final String title;
  final bool showDivider;
  final bool showSeeAll;
  final double? fontSize;
  final ProductListType? type;

  HeaderTitleViewModel({
    required this.title,
    this.showDivider = true,
    this.showSeeAll = false,
    this.type,
    this.fontSize,
  });
}

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({super.key, required this.itemViewModel});

  final HeaderTitleViewModel itemViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(itemViewModel.title, style: AppTextsStyle.bold(size: itemViewModel.fontSize ?? 11)),
            Spacer(),
            if (itemViewModel.showSeeAll)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
                child: OpenContainerAnimation(
                  openBuilder: (context, _) =>
                      ProductsDisplayPage(type: itemViewModel.type!, title: itemViewModel.title),
                  closedBuilder: (context, openContainer) => InkWell(
                    child: Text(AppTexts.seeAll, style: AppTextsStyle.bold(size: 14, color: AppColors.primary)),
                  ),
                ),
              ),
          ],
        ),
        if (itemViewModel.showDivider)
          Container(
            height: 3,
            width: 40,
            decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.all(Radius.circular(3))),
          ),
      ],
    );
  }
}
