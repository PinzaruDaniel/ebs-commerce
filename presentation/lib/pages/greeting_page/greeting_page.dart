import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/greeting_page/greeeting_controller.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';
import 'package:presentation/util/widgets/select_checkbox_widget.dart';

import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  GreetingController get greetingController => Get.find();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    Get.put(GreetingController());
    greetingController.getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          final hasAgreed = greetingController.hasAgreedTerms.value;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              AppIcons.ebsIcon,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Text(AppTexts.ebsForWish, style: AppTextsStyle.bold(size: 36), textAlign: TextAlign.center),
              ),
              Visibility(
                visible: !hasAgreed,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0, top: 60, left: 24, right: 24),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: SelectCheckboxWidget(
                      title: AppTexts.agreeUserTerms,
                      selected: isChecked || hasAgreed,
                      selectedColor: Colors.black,
                      tristate: false,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      textStyle: AppTextsStyle.medium.copyWith(color: AppColors.greyText, fontSize: 16),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    BaseButtonWidget(
                      buttonColor: (isChecked || hasAgreed) ? AppColors.primary : Colors.grey.shade300,
                      textColor: (isChecked || hasAgreed) ? Colors.white : Colors.grey,
                      onTap: () {
                        AppPopUp.showConfirmationDialog(context: context, content: '', title: AppTexts.itIsInProgress);
                      },
                      title: AppTexts.signUp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 16),
                      child: BaseButtonWidget(
                        buttonColor: Colors.grey.shade300,
                        textColor: (isChecked || hasAgreed) ? Colors.black : Colors.grey,
                        onTap: () {
                          if (isChecked || hasAgreed) {
                            AppRouter.openAuthPage();
                            Future.delayed(Duration(milliseconds: 300), () {
                              greetingController.hasAgreedTerms.value = true;
                              greetingController.setSettings();
                            });
                          } else {
                            AppPopUp.showConfirmationDialog(
                              context: context,
                              content: '',
                              title: AppTexts.pleaseAgree,
                            );
                          }
                        },

                        title: AppTexts.logIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
