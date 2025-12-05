import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/greeting_page/widgets/button_without_password_widget.dart';
import 'package:presentation/pages/greeting_page/widgets/company_icon_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';
import 'package:snackify/enums/snack_enums.dart';

import '../../util/resources/app_text_styles.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/select_checkbox_widget.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  bool hasAgreed = currentUserController.hasAgreedTerms.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: CompanyIconWidget()),

            if (!currentUserController.hasAgreedTerms.value)
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0, left: 24, right: 24),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      hasAgreed = !hasAgreed;
                    });
                  },
                  child: SelectCheckboxWidget(
                    title: AppTexts.agreeUserTerms,
                    selected: hasAgreed,
                    selectedColor: Colors.black,
                    tristate: false,
                    onChanged: (value) {
                      setState(() {
                        hasAgreed = value!;
                      });
                    },
                    textStyle: AppTextsStyle.medium.copyWith(color: AppColors.greyText, fontSize: 16),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseButtonWidget(
                    buttonColor: hasAgreed ? AppColors.primary : Colors.grey.shade300,
                    textColor: hasAgreed ? Colors.white : Colors.grey,
                    onTap: () {
                      if (hasAgreed) {
                        currentUserController.hasAgreedTerms.value = true;
                        currentUserController.setSettings();

                        AppRouter.openAuthPage();
                      } else {
                        AppPopUp.showConfirmationDialog(context: context, content: '', title: AppTexts.pleaseAgree);
                      }
                    },
                    title: AppTexts.logIn,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: BaseButtonWidget(
                      buttonColor: Colors.transparent,
                      textColor: hasAgreed ? AppColors.greyText : Colors.grey,
                      onTap: () async {
                        if (hasAgreed) {
                          currentUserController.hasAgreedTerms.value = true;
                          AppRouter.openHomePage(removeUntil: true);
                          currentUserController.setSettings();
                        }
                      },
                      title: AppTexts.enterWithoutPassword,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
