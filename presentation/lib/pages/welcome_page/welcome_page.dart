import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';

import '../../util/resources/app_texts.dart';
import '../home_page/widgets/language_dropdown_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBorder: false,
        leading: SizedBox(),
        actions: [
          LanguageDropdown(),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(AppTexts.helloHuman, style: AppTextsStyle.bold(size: 36)),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                if(currentUserController.isUserLogged.value){
                  Get.offAllNamed('/home');
                }
                else{
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
