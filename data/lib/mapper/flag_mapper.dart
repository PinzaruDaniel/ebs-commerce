import 'package:data/modules/delivery_address/models/remote/index.dart';
import 'package:domain/modules/delivery_address/models/index.dart';

extension FlagDtoMapper on FlagApiDto{
  FlagEntity get toEntity{
    return FlagEntity(iso2: iso2, unicodeFlag: unicodeFlag);
  }
}