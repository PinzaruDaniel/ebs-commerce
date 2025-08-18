import 'package:data/modules/delivery_address/models/remote/index.dart';
import 'package:domain/modules/delivery_address/models/index.dart';

extension StatesApiDtoMapper on StatesApiDto {
  StatesEntity get toEntity{
    return StatesEntity(name: name, code: code);
  }
}