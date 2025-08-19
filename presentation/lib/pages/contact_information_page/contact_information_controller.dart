import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/widgets/text_field_widget.dart';

class ContactInformationController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();

  void initAllItems() {
  final existingUser = user.value;

  allItems.value = [
    TextFieldViewModel(
      title: 'Name',
      initialValue: existingUser?.name ?? '',
    ),
    TextFieldViewModel(
      title: 'Surname',
      initialValue: existingUser?.surname ?? '',

    ),
    TextFieldViewModel(
      title: 'Phone',
      textInputType: TextInputType.phone,
      initialValue: existingUser?.number ?? '',
    ),
    TextFieldViewModel(
      title: 'Email',
      textInputType: TextInputType.emailAddress,
      initialValue: existingUser?.email ?? '',
    ),
  ];
}

  UserViewModel toUserViewModel() {
  final model = UserViewModel(
    name: (allItems[0] as TextFieldViewModel).value.value,
    surname: (allItems[1] as TextFieldViewModel).value.value,
    number: (allItems[2] as TextFieldViewModel).value.value,
    email: (allItems[3] as TextFieldViewModel).value.value,
  );
  user.value = model;
  return model;
}

}
