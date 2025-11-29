import 'package:data/modules/delivery_address/models/remote/index.dart';
import 'package:domain/modules/delivery_address/models/index.dart';

extension DialCodesDtoMapper on DialCodesDto{
  DialCodesEntity get toEntity{
    return DialCodesEntity(name: name, code: code, dialCode: dialCode);
  }
}