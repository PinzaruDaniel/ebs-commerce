import 'package:domain/modules/delivery_address/models/index.dart';

import '../../view/state_view_model.dart';

extension StateEntityMapper on StatesEntity {
  StateViewModel get toViewModel {
    return StateViewModel(name: name, code: code);
  }
}