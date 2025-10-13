import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:presentation/view/flag_view_model.dart';

extension FlagViewModelMapper on FlagEntity {
  FlagViewModel get toModel {
    return FlagViewModel(iso2: iso2, unicodeFlag: unicodeFlag);
  }
}
