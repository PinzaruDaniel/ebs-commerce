import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/resources/app_texts.dart';
import '../../util/widgets/text_field_widget.dart';

class ContactInformationController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();

  void initAllItems() {
    final existingUser = user.value;
    allItems.value = [
      TextFieldViewModel(keyId: 'name', title: AppTexts.name, initialValue: existingUser?.name ?? ''),
      TextFieldViewModel(keyId: 'surname', title: AppTexts.surname, initialValue: existingUser?.surname ?? ''),
      TextFieldViewModel(
        keyId: 'phone',
        title: AppTexts.phone,
        textInputType: TextInputType.phone,
        initialValue: existingUser?.number ?? '',
        customValidator: (text) {
          if (text == null || text.isEmpty) return AppTexts.numberIsRequired;
          final phoneRegex = RegExp(r'^[0-9]{8,15}$');
          if (!phoneRegex.hasMatch(text)) return AppTexts.invalidNumberPhone;
          return null;
        },
      ),
      TextFieldViewModel(
        keyId: 'email',
        title: AppTexts.email,
        textInputType: TextInputType.emailAddress,
        initialValue: existingUser?.email ?? '',
        customValidator: (text) {
          if (text == null || text.isEmpty) return AppTexts.emailIsRequired;
          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
          if (!emailRegex.hasMatch(text)) return AppTexts.invalidEmail;
          return null;
        },
      ),
    ];
  }

  UserViewModel? toUserViewModel() {
    String getPlaceholderByKeyId(String keyId) {
      final item =
          allItems.firstWhere(
                (element) => element is TextFieldViewModel && element.keyId == keyId,
                orElse: () => TextFieldViewModel(title: '', initialValue: ''),
              )
              as TextFieldViewModel;
      return item.placeholder;
    }

    return user.value = UserViewModel(
      name: getPlaceholderByKeyId('name'),
      surname: getPlaceholderByKeyId('surname'),
      number: getPlaceholderByKeyId('phone'),
      email: getPlaceholderByKeyId('email'),
    );
  }
}
