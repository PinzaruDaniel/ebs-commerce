import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:presentation/view/dial_codes_view_model.dart';

extension DialCodesViewModelMapper on DialCodesEntity{
  DialCodesViewModel get toModel{
    return DialCodesViewModel(name: name, code: code, dialCode: dialCode);
  }
}