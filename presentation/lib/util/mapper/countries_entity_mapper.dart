import 'package:domain/modules/delivery_address/models/index.dart';

import '../../view/country_view_model.dart';

extension CountriesEntityMapper on CountriesEntity {
  CountryViewModel get toViewModel {
    return CountryViewModel(name: name, iso2: iso2);
  }
}