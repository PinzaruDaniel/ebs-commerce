import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../localization/localization_loader.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return PullDownButton(
      menuOffset: -20,
      itemBuilder: (context) => LocalizationLoader().supportedLocales.map((locale) {
        return PullDownMenuItem.selectable(
          onTap: () {
            mainAppController.changeLanguage(locale, context);
          },
          title: LocalizationLoader().languageNames[locale.languageCode] ?? locale.languageCode.toUpperCase(),
          icon: currentLocale.languageCode == locale.languageCode ? Icons.check : null,
        );
      }).toList(),
      buttonBuilder: (context, showMenu) => IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              const Icon(Icons.language, color: Colors.black),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('Language', style: AppTextsStyle.medium),
              ),
            ],
          ),
        ),
        onPressed: showMenu,
      ),
    );
  }
}
