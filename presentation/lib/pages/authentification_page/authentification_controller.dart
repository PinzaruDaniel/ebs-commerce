import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../util/resources/app_texts.dart';
import '../../view/user_view_model.dart';

class AuthentificationController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();
  Rxn<String> password = Rxn<String>();

  void initAllItems() {
    print('Initializing all items...');
    allItems.value = [
      TextFieldViewModel(
        hintText: 'pinzaru.daniel@gmail.com',
        keyId: 'email',
        title: AppTexts.email,
        textInputType: TextInputType.emailAddress,
        initialValue: user.value?.email ?? '',
        customValidator: (text) {
          if (text == null || text.isEmpty) return AppTexts.emailIsRequired;
          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
          if (!emailRegex.hasMatch(text)) return AppTexts.invalidEmail;
          return null;
        },
      ),
      TextFieldViewModel(
        hintText: 'Your Secret password',
        keyId: 'password',
        title: 'Password',
        initialValue: password.value ?? '',
        textInputType: TextInputType.visiblePassword,

      ),
    ];
    allItems.refresh();
    print('Items count: ${allItems.length}');
  }
}
