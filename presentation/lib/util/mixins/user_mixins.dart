import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:presentation/pages/welcome_page/welcome_page.dart';

import '../../controllers/controller_imports.dart';
import '../../pages/home_page/home_page.dart';
import '../resources/app_texts.dart';
import '../routing/app_pop_up.dart';
import '../routing/app_router.dart';

mixin LoginFunctions {
  Widget sessionExpired({required bool isSessionExpired}) {
    return isSessionExpired
        ? HomePage(isSessionExpired: isSessionExpired)
        : currentUserController.hasAgreedTerms.value
        ? HomePage()
        : WelcomePage();
  }

  void logOut({bool isSessionExpired = false, Function? onAuth}) {
    isSessionExpired
        ? AppPopUp.showConfirmationDialog(
            barrierDismissible: false,
            context: Get.context!,
            title: AppTexts.sessionExpired,
            content: AppTexts.pleaseLoginAgain,
            showCancelButton: false,
            onSave: () {
              currentUserController.deleteUsers();
              currentUserController.deleteTokens();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppRouter.openGreetingPage(removeUntil: true, withAnimation: false);
              });
            },
          )
        : AppPopUp.showConfirmationDialog(
            title: AppTexts.confirmLogOut,
            content: AppTexts.deleteDataWarning,
            context: Get.context!,
            onSave: () async {
              await currentUserController.clearUserData();
              currentUserController.deleteTokens();
              currentUserController.deleteUsers();
              AppRouter.openGreetingPage(removeUntil: true, withAnimation: false);
              await onAuth?.call();
            },
          );
  }
}
