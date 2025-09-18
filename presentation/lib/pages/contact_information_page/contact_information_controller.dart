import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/widgets/text_field_widget.dart';

class ContactInformationController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();

  void setUser(UserViewModel userModel) {
    user.value = userModel;
  }

  void initAllItems() {
    final existingUser = user.value;
    print('Name: ${existingUser?.name}');

    allItems.value = [
      TextFieldViewModel(
        keyId: 'name',
        title: 'Name',
        initialValue: existingUser?.name ?? '',
      ),
      TextFieldViewModel(
        keyId: 'surname',
        title: 'Surname',
        initialValue: existingUser?.surname ?? '',
      ),
      TextFieldViewModel(
        keyId: 'phone',
        title: 'Phone',
        textInputType: TextInputType.phone,
        initialValue: existingUser?.number ?? '',
        customValidator: (text) {
          if (text == null || text.isEmpty) return "Phone number is required";
          final phoneRegex = RegExp(r'^[0-9]{8,15}$');
          if (!phoneRegex.hasMatch(text)) return "Enter a valid phone number";
          return null;
        },
      ),
      TextFieldViewModel(
        keyId: 'email',
        title: 'Email',
        textInputType: TextInputType.emailAddress,
        initialValue: existingUser?.email ?? '',
        customValidator: (text) {
          if (text == null || text.isEmpty) return "Email is required";
          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
          if (!emailRegex.hasMatch(text)) return "Enter a valid email";
          return null;
        },
      ),
    ];
  }

  UserViewModel? toUserViewModel() {
    String getPlaceholderByKeyId(String keyId) {
      final item = allItems.firstWhere(
            (element) => element is TextFieldViewModel && element.keyId == keyId,
        orElse: () => TextFieldViewModel(title: '', initialValue: ''),
      ) as TextFieldViewModel;

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
