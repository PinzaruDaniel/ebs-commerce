import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/util/resources/app_colors.dart';

class AppIcons {
  //icons
  static SvgPicture cartIcon = SvgPicture.asset('assets/icons/Cart icon.svg');

  static SvgPicture countryFlag({required String iso2}) => SvgPicture.asset('assets/flags/$iso2.svg', height: 20);

  static Icon backIcon({Color? color, double? size}) =>
      Icon(Icons.arrow_back_ios_new_rounded, color: color ?? AppColors.primary, size: size ?? 20);
  static SvgPicture filtersIcon = SvgPicture.asset('assets/icons/filters.svg');

  static Image companyIcon({double? width}) => Image(image: AssetImage('assets/icons/icon.png'), width: width ?? 16);
  static SvgPicture toCartIcon = SvgPicture.asset('assets/icons/Union.svg', height: 14);
  static Image fanCourier = Image(image: AssetImage('assets/icons/fan_courier.png'));
  static Image dhl = Image(image: AssetImage('assets/icons/dhl.png'));

  //default images
  static Image noImage({double? height, double? width}) =>
      Image(image: AssetImage('assets/icons/noimage.png'), width: width, height: height, fit: BoxFit.cover);
  static const String adBanner = 'assets/banner/banner.png';
}
