import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageDropdown extends StatefulWidget {

  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ro'),
    Locale('ru')
  ];

  final Map<String, String> languageNames = {
    'en': 'English',
    'ro': 'Romanian',
    'ru': 'Russian'
  };

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return PullDownButton(
      itemBuilder: (context) => supportedLocales.map((locale) {
        return PullDownMenuItem.selectable(
          onTap: () {
            context.setLocale(locale);
            Get.updateLocale(locale);
          },
          title: languageNames[locale.languageCode] ??
              locale.languageCode.toUpperCase(),
          icon: currentLocale.languageCode == locale.languageCode
              ? Icons.check
              : null,
        );
      }).toList(),
      buttonBuilder: (context, showMenu) => IconButton(
        icon: const Icon(Icons.language, color: Colors.black),
        onPressed: showMenu,
      ),
    );
  }
}
