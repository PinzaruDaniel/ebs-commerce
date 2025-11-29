import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class LocalizationLoader extends AssetLoader{
  LocalizationLoader();

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
  Future<Map<String, dynamic>> load(String path, Locale locale) async{
    final languageCode=locale.languageCode;
    final fileName='localization_$languageCode.json';
    final fullPath='$path/$fileName';
    final jsonString=await rootBundle.loadString(fullPath);
    return json.decode(jsonString);
  }
}