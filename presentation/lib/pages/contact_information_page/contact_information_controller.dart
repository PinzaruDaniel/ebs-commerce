import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:presentation/pages/contact_information_page/widgets/text_field_contact_info_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

class ContactInformationController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();

  void initAllItems() {
  final existingUser = user.value;

  allItems.value = [
    TextFieldContactInfoViewModel(
      title: 'Name',
      initialValue: existingUser?.name ?? '',
    ),
    TextFieldContactInfoViewModel(
      title: 'Surname',
      initialValue: existingUser?.surname ?? '',
    ),
    TextFieldContactInfoViewModel(
      title: 'Phone',
      textInputType: TextInputType.phone,
      initialValue: existingUser?.number ?? '',
    ),
    TextFieldContactInfoViewModel(
      title: 'Email',
      textInputType: TextInputType.emailAddress,
      initialValue: existingUser?.email ?? '',
    ),
  ];
}

  UserViewModel toUserViewModel() {
  final model = UserViewModel(
    name: (allItems[0] as TextFieldContactInfoViewModel).value.value,
    surname: (allItems[1] as TextFieldContactInfoViewModel).value.value,
    number: (allItems[2] as TextFieldContactInfoViewModel).value.value,
    email: (allItems[3] as TextFieldContactInfoViewModel).value.value,
  );
  user.value = model;
  return model;
}

}
