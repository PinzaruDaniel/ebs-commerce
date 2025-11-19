import 'package:di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/localization/localization_loader.dart';
import 'package:presentation/entry_page.dart';

import 'controllers/bindings/root_bindings_controllers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await RootBinding().dependencies();
  await EasyLocalization.ensureInitialized();
  nomenclatureController.initCountries();
  if (currentUserController.userVM.value != null) {
    currentUserController.syncUser();
  }
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationLoader().supportedLocales,
      path: 'assets/localization',
      fallbackLocale: Locale('ro'),
      startLocale: Locale('ro'),
      assetLoader: LocalizationLoader(),
      child: EntryPage(),
    ),
  );
}

