import 'package:common/constants/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/mixins/user_mixins.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:get/get.dart';
import 'util/resources/app_colors.dart';
import 'util/routing/app_router.dart';
import 'pages/home_page/home_page.dart';
import 'pages/welcome_page/welcome_page.dart';

class EntryPage extends StatelessWidget with LoginFunctions{
  final bool isSessionExpired;

  const EntryPage({super.key, required this.isSessionExpired});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppTexts.appTitle,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        extensions: [
          PullDownButtonTheme(
            routeTheme: PullDownMenuRouteTheme(
              backgroundColor: Colors.white,
              shadow: BoxShadow(color: Colors.black45, spreadRadius: 1, blurRadius: 10),
            ),
            dividerTheme: PullDownMenuDividerTheme(dividerColor: Colors.black),
          ),
        ],
        bottomSheetTheme: BottomSheetThemeData(dragHandleColor: Colors.grey.shade300),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primary,
          selectionColor: Colors.grey,
          selectionHandleColor: AppColors.primary,
        ),
      ),
      builder: (context, child) {
        return Overlay(initialEntries: [OverlayEntry(builder: (context) => child ?? Container())]);
      },
      home: sessionExpired(isSessionExpired: isSessionExpired),
    );
  }
}
