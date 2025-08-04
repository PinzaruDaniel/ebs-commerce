import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static SvgPicture cartIcon = SvgPicture.asset('assets/icons/Cart icon.svg');
  static Icon backIcon({required Color color, required double size}) => Icon(Icons.arrow_back_ios_new_rounded, color: color, size: size,);
  static SvgPicture filtersIcon = SvgPicture.asset('assets/icons/filters.svg');
  static String companyIcon='assets/icons/icon.png';
}
