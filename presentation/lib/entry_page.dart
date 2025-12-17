import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/mixins/user_mixins.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'main.dart';
import 'util/resources/app_colors.dart';

class EntryPage extends StatelessWidget with LoginFunctions {
  final bool isSessionExpired;

  const EntryPage({super.key, required this.isSessionExpired});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 00,
      child: GetMaterialApp(
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
      ),
    );
  }
}
