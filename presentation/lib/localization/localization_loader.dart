import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class LocalizationLoader extends AssetLoader{
  const LocalizationLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async{
    final languageCode=locale.languageCode;
    final fileName='localization_$languageCode.json';
    final fullPath='$path/$fileName';
    final jsonString=await rootBundle.loadString(fullPath);
    return json.decode(jsonString);
  }
}