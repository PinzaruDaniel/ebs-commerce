import 'package:presentation/view/base_view_model.dart';

class CountryFlagDialCodeViewModel extends BaseViewModel {
  final String name;
  final String iso2;
  final String flag;
  final String dialCode;
  final String phoneMaskMobileInternational;

  CountryFlagDialCodeViewModel({
    required this.name,
    required this.iso2,
    required this.flag,
    required this.dialCode,
    required this.phoneMaskMobileInternational,
  });
}
