import 'package:domain/modules/delivery_address/models/index.dart';

import '../../view/city_view_model.dart';

extension CitiesResponseEntityMapper on CitiesResponseEntity {
  CityViewModel get toModel{
    return CityViewModel(id: id, name: name);
}
}