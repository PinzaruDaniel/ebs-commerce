import 'package:data/modules/states/models/remote/index.dart';
import 'package:domain/modules/states/models/index.dart';

extension StatesApiDtoMapper on StatesApiDto {
  StatesEntity get toEntity{
    return StatesEntity(name: name);
  }
}