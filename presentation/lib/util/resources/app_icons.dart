import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/util/resources/app_colors.dart';

class AppIcons {

  //icons
  static SvgPicture cartIcon = SvgPicture.asset('assets/icons/Cart icon.svg');

  static Icon backIcon({ Color? color, double? size}) =>
      Icon(Icons.arrow_back_ios_new_rounded, color: color ?? AppColors.primary, size: size ?? 20,);
  static SvgPicture filtersIcon = SvgPicture.asset('assets/icons/filters.svg');
  static String companyIcon = 'assets/icons/icon.png';
  static SvgPicture toCartIcon = SvgPicture.asset('assets/icons/Union.svg', height: 14);

//default images
  static const String noImage='assets/products/noimage.png';
  static const String adBanner='assets/banner/banner.png';

}
