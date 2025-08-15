import 'package:data/modules/cities/models/remote/index.dart';
import 'package:domain/modules/cities/models/index.dart';

extension CitiesResponseApiDtoMapper on CitiesResponseApiDto{
  CitiesResponseEntity get toEntity{
    return CitiesResponseEntity(error: error, msg: msg, data: data);
  }
}