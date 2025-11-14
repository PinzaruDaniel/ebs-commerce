import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/greeting_page/widgets/button_without_password_widget.dart';
import 'package:presentation/pages/greeting_page/widgets/company_icon_widget.dart';
import 'package:presentation/pages/greeting_page/widgets/user_terms_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';

import '../../util/resources/app_texts.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  bool isChecked = currentUserController.hasAgreedTerms.value;
  var hasAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: CompanyIconWidget()),

            if (!isChecked)
              UserTermsWidget(
                onTap: () {
                  setState(() {
                    hasAgreed = !hasAgreed;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    hasAgreed = value;
                  });
                },
                hasAgreed: hasAgreed,
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  BaseButtonWidget(
                    buttonColor: (isChecked || hasAgreed) ? AppColors.primary : Colors.grey.shade300,
                    textColor: (isChecked || hasAgreed) ? Colors.white : Colors.grey,
                    onTap: () {
                      if (isChecked || hasAgreed) {
                        AppRouter.openAuthPage();
                        currentUserController.hasAgreedTerms.value = true;
                        currentUserController.setSettings();
                      } else {
                        AppPopUp.showConfirmationDialog(context: context, content: '', title: AppTexts.pleaseAgree);
                      }
                    },

                    title: AppTexts.logIn,
                  ),

                  ButtonWithoutPasswordWidget(
                    onTap: () async {
                      if (isChecked || hasAgreed) {
                        currentUserController.hasAgreedTerms.value = true;
                        currentUserController.setSettings();
                        await currentUserController.clearUserData();
                        Get.offAllNamed('/home');
                      }
                    },
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
