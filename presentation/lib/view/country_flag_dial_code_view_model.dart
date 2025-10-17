import 'package:presentation/view/base_view_model.dart';

class CountryFlagDialCodeViewModel extends BaseViewModel {
  final String countryName;
  final String countryCode;
  final String countryFlag;
  final String countryDialCode;
  final String phoneMaskMobileInternational;

  CountryFlagDialCodeViewModel({
    required this.countryName,
    required this.countryCode,
    required this.countryFlag,
    required this.countryDialCode,
    required this.phoneMaskMobileInternational,
  });
}
