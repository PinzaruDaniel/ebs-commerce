import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_refresh_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../util/resources/app_texts.dart';
import '../../view/user_view_model.dart';

class AuthentificationController extends GetxController {
  final AuthLoginUseCase authLoginUseCase = GetIt.instance<AuthLoginUseCase>();
  final AuthRefreshUseCase authRefreshUseCase = GetIt.instance<AuthRefreshUseCase>();
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();
  Rxn<String> password = Rxn<String>();
  RxBool isPasswordVisible = RxBool(false);

  void initAllItems() {
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
  }

  void toggleVisibilityPassword() {
    isPasswordVisible.toggle();
  }

  Future<void> loginUser() async {
    final userTest = toUserTest();
    if (userTest == null) {
      showFailureSnackBar(failure: Failure.error('Email or password is empty'));
      return;
    }

    final params = AuthLoginParams(email: userTest.email, password: userTest.password);
    final either = await authLoginUseCase(params);
    either.fold(
          (failure) => showFailureSnackBar(failure: failure),
          (response) {
        consoleLog('AccessToken: ${response.accessToken}');
        consoleLog('RefreshToken: ${response.refreshToken}');
      },
    );

  }

  UserTest? toUserTest() {
    String getValueByKeyId(String keyId) {
      final item = allItems.firstWhere(
            (element) => element is TextFieldViewModel && element.keyId == keyId,
        orElse: () => TextFieldViewModel(title: '', initialValue: '', hintText: ''),
      ) as TextFieldViewModel;

      return item.placeholder;
    }

    final email = getValueByKeyId('email');
    final password = getValueByKeyId('password');
    return UserTest(email: email, password: password);
  }

}

class UserTest {
  final String email;
  final String password;

  UserTest({required this.email, required this.password});
}
