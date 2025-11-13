import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../util/resources/app_texts.dart';
import '../../util/widgets/language_dropdown_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

final typerController = AnimatedTextController();

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBorder: false, leading: SizedBox(), actions: [LanguageDropdown()]),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: Row(
                children: [


                  DefaultTextStyle(
                    key: ValueKey('${AppTexts.hello}_${Get.locale?.languageCode}'),

                    style: AppTextsStyle.bold(size: 36),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          currentUserController.userVM.value!=null ?
                          '${AppTexts.hello}, ${currentUserController.userVM.value?.name}':
                        '${AppTexts.hello}, ${AppTexts.human}',
                          speed: Duration(milliseconds: 100),
                          cursor: '|'
                        ),
                      ],
                      controller: typerController,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                if (currentUserController.isUserLogged.value) {
                  Get.offAllNamed('/home');
                } else {
                  AppRouter.openGreetingPage();
                }
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  AppTexts.tapToContinue,
                  style: AppTextsStyle.medium.copyWith(fontSize: 16, color: AppColors.greyText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
