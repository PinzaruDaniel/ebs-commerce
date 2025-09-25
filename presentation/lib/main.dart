import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/localization/localization_loader.dart';
import 'package:presentation/pages/home_page/home_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'controllers/bindings/root_bindings_controllers.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await RootBinding().dependencies();
  await EasyLocalization.ensureInitialized();
//TODO: din resources in assets localization
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ru'), Locale('ro')],
      path: 'lib/util/resources/localization',
      fallbackLocale: Locale('ro'),
      startLocale: Locale('ro'),
      assetLoader: LocalizationLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce ebs app',
      debugShowCheckedModeBanner: false,

      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(dragHandleColor: Colors.grey.shade300),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito-sans',
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primary,
          selectionColor: Colors.grey,
          selectionHandleColor: AppColors.primary,
        ),
      ),

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>HomePage())
      ],
    );
  }
}
