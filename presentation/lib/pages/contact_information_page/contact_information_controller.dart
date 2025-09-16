import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
      TextFieldViewModel(keyId: 'name', title: 'Name', initialValue: existingUser?.name ?? ''),
      TextFieldViewModel(keyId: 'surname', title: 'Surname', initialValue: existingUser?.surname ?? ''),
      TextFieldViewModel(
        keyId: 'phone',
        title: 'Phone',
        textInputType: TextInputType.phone,
        initialValue: existingUser?.number ?? '',
      ),
      TextFieldViewModel(
        keyId: 'email',
        title: 'Email',
        textInputType: TextInputType.emailAddress,
        initialValue: existingUser?.email ?? '',
      ),
    ];
  }

  UserViewModel? toUserViewModel() {
    final items = allItems.whereType<TextFieldViewModel>().toList();

    final name = items.firstWhereOrNull((e) => e.keyId == 'name')?.placeholder ?? '';
    final surname = items.firstWhereOrNull((e) => e.keyId == 'surname')?.placeholder ?? '';
    final number = items.firstWhereOrNull((e) => e.keyId == 'phone')?.placeholder ?? '';
    final email = items.firstWhereOrNull((e) => e.keyId == 'email')?.placeholder ?? '';

    print('name: $name, surname: $surname, number: $number, email: $email');

    if (name.isEmpty && surname.isEmpty && number.isEmpty && email.isEmpty) return null;

    return UserViewModel(name: name, surname: surname, number: number, email: email);
  }
}
