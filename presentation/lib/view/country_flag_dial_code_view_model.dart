import 'package:presentation/view/base_view_model.dart';

class CountryFlagDialCodeViewModel extends BaseViewModel {
  final String countryName;
  final String countryCode;
  final String countryFlag;
  final String countryDialCode;

  CountryFlagDialCodeViewModel({
    required this.countryName,
    required this.countryCode,
    required this.countryFlag,
    required this.countryDialCode,
  });
}
