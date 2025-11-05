import 'dart:async';

import 'package:flutter_libphonenumber/flutter_libphonenumber.dart' as lib_phone_number;
import 'package:get/get.dart';
import 'package:presentation/view/country_flag_dial_code_view_model.dart';

class NomenclatureController extends GetxController {
  RxList<CountryFlagDialCodeViewModel> countriesFlagsDialCode = RxList([]);
  RxList<CountryFlagDialCodeViewModel> filteredCountriesFlagsDialCode = RxList([]);
  List<lib_phone_number.CountryWithPhoneCode> countries = [];

  void initCountries() async {
    await lib_phone_number.init();
    countries = lib_phone_number.CountryManager().countries;
    mapCountries();
    filteredCountriesFlagsDialCode.assignAll(countriesFlagsDialCode);
  }

  @override
  void onInit() {
    super.onInit();
    initCountries();
  }

  void mapCountries() {

    for (var country in countries) {
      countriesFlagsDialCode.add(
        CountryFlagDialCodeViewModel(
          name: country.countryName ?? '',
          iso2: country.countryCode.toUpperCase(),
          dialCode: country.phoneCode,
          phoneMaskMobileInternational: country.phoneMaskMobileInternational,
          exampleNumberMobileInternational: country.exampleNumberMobileInternational,
        ),
      );
    }

    countriesFlagsDialCode.sort((a, b) => a.name.compareTo(b.name));
  }
}
