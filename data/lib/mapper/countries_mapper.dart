import 'package:data/modules/countries/models/remote/index.dart';
import 'package:domain/modules/countries/models/index.dart';

extension CountriesApiDtoMapper on CountriesApiDto{
  CountriesEntity get toEntity{
    return CountriesEntity(name: name, iso2: iso2);
  }
}