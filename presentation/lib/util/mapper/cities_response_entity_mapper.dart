import 'package:domain/modules/delivery_address/models/index.dart';

import '../../view/city_view_model.dart';

extension CitiesResponseEntityMapper on CitiesResponseEntity {
  List<CityViewModel> get toViewModelList {
    return data.map((city) => CityViewModel(name: city)).toList();
  }
}