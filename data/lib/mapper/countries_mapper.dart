
import 'package:domain/modules/delivery_address/models/index.dart';

import '../modules/delivery_address/models/remote/index.dart';

extension CountriesApiDtoMapper on CountriesApiDto{
  CountriesEntity get toEntity{
    return CountriesEntity(id:id, name: name, iso2: iso2, dialCode: dialCode);
  }
}