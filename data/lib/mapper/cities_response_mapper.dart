

import 'package:domain/modules/delivery_address/models/index.dart';

import '../modules/delivery_address/models/remote/index.dart';

extension CitiesResponseApiDtoMapper on CitiesResponseApiDto{
  CitiesResponseEntity get toEntity{
    return CitiesResponseEntity(error: error, msg: msg, data: data);
  }
}