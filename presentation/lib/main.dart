import 'package:common/constants/logger.dart';
import 'package:common/constants/session_expired_callback.dart';
import 'package:di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/localization/localization_loader.dart';
import 'package:presentation/entry_page.dart';
import 'package:presentation/util/mixins/user_mixins.dart';

import 'controllers/bindings/root_bindings_controllers.dart';

void main() async {
  bool isSessionExpired = false;
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(
    onSessionExpired: () {
      isSessionExpired = true;
      consoleLog('in main changed session bool= $isSessionExpired');
    },
  );
  await RootBinding().dependencies();
  await EasyLocalization.ensureInitialized();
  nomenclatureController.initCountries();
  if (currentUserController.userVM.value != null) {
    await currentUserController.syncUser();
  }
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationLoader().supportedLocales,
      path: 'assets/localization',
      fallbackLocale: Locale('ro'),
      startLocale: Locale('ro'),
      assetLoader: LocalizationLoader(),
      child: EntryPage(isSessionExpired: isSessionExpired),
    ),
  );
}
