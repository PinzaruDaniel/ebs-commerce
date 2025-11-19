import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:get/get.dart';
import '../../util/resources/app_colors.dart';
import '../../util/routing/app_router.dart';
import '../home_page/home_page.dart';
import '../welcome_page/welcome_page.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce ebs app',
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
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          customTransition: SharedAxisCustomTransition(),
          transitionDuration: Duration(milliseconds: 400),
        ),
      ],
    );
  }
}
