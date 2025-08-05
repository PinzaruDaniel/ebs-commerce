import 'package:flutter/material.dart';

class AppTextsStyle {
  static TextStyle bold({double? size, Color? color}) =>
      TextStyle(fontFamily: 'Nunito-Sans', fontSize: size ?? 16, fontWeight: FontWeight.bold, color: color?? Colors.black);
  static const TextStyle medium = TextStyle(fontFamily: 'Nunito-Sans', fontSize: 14);
}
