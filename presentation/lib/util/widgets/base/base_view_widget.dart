import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import '../bottom_navigation_bar_widget.dart';

class BaseViewWidget extends StatelessWidget {
  final Widget child;
  final Widget? saveButton;
  final Function? onDone;
  final String? title;
  final Function? onSave;
  final bool showIcon;
  final Color? buttonColor;
  final Color? textColor;
  final String? barTitle;

  const BaseViewWidget({
    super.key,
    required this.child,
    this.saveButton,
    this.onDone,
    this.title,
    this.onSave,
    this.showIcon=false,
    this.buttonColor,
    this.textColor,
    this.barTitle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (title != null)
                            Text(
                              '${AppTexts.choose} ${title?.toLowerCase()}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (onDone != null)
                            GestureDetector(
                              onTap: () {
                                onDone?.call();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColors.primary,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                                child: Text(AppTexts.done, style: AppTextsStyle.medium.copyWith(color: Colors.white)),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                child,

                if (onSave != null)
                  BottomNavigationBarWidget(
                    buttonColor: buttonColor ?? AppColors.primary,
                    textColor: textColor ?? Colors.white,
                    title: barTitle ?? AppTexts.save,
                    onTap: () => onSave?.call(),
                    showIcon: showIcon,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
