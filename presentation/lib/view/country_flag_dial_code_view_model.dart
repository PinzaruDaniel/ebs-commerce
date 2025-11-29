import 'package:presentation/view/base_view_model.dart';

class CountryFlagDialCodeViewModel extends BaseViewModel {
  final String name;
  final String iso2;/*
  final String flag;
  final String? flagSvg;*/
  final String dialCode;
  final String phoneMaskMobileInternational;
  final String exampleNumberMobileInternational;


  CountryFlagDialCodeViewModel({
    required this.name,
    required this.iso2,/*
    required this.flag,
    this.flagSvg,*/
    required this.dialCode,
    required this.phoneMaskMobileInternational,
    required this.exampleNumberMobileInternational,
  });
}
