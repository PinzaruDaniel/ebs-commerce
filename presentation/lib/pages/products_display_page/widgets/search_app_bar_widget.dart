import 'package:flutter/material.dart';

import '../../../util/resources/app_colors.dart';
import '../../../util/resources/app_icons.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../util/resources/app_texts.dart';
import '../../../util/widgets/text_field_widget.dart';

class SearchAppBarWidget extends StatelessWidget {
  final bool isExpanded;
  final double height;
  final double collapsedHeight;
  final String title;
  final double progress;
  final Function() goBack;
  final Function() toggle;
  final TextEditingController textEditingController;

  const SearchAppBarWidget({
    super.key,
    required this.isExpanded,
    required this.height,
    required this.title,
    required this.progress,
    required this.goBack,
    required this.toggle,
    required this.collapsedHeight,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: !isExpanded,
      floating: !isExpanded,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      expandedHeight: height,
      collapsedHeight: height,
      shape: const Border(bottom: BorderSide(color: Colors.black12)),
      title: Text(title, style: AppTextsStyle.bold(size: 18)),
      leading: IconButton(
        icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        onPressed: () {
          goBack.call();
        },
      ),
      actions: [
        Opacity(
          opacity: 1 - progress,
          child: Transform.scale(
            scale: 1 - (0.1 * progress),
            child: IconButton(icon: const Icon(Icons.search), onPressed: isExpanded ? null : toggle),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 46.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: progress,
              child: Transform.scale(
                scale: 0.8 + (0.2 * progress),
                child: height > collapsedHeight
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0 ),
                        child: SingleChildScrollView(
                          //physics: const NeverScrollableScrollPhysics(),
                          child:
                          TextFieldWidget(
                            itemViewModel: TextFieldViewModel(
                              hintText: AppTexts.search,
                              isRequiredValidation: false,
                              textController: textEditingController,
                            ),
                            suffixIcon: IconButton(icon: const Icon(Icons.close), onPressed: toggle),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
