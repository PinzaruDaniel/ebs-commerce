import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_refresh_use_case.dart';
import 'package:domain/modules/user_information/use_cases/get_user_from_api_use_case.dart';
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
  GetUserFromApiUseCase getUserFromApiUseCase = GetIt.instance<GetUserFromApiUseCase>();
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();
  Rxn<String> password = Rxn<String>();
  RxBool isPasswordVisible = RxBool(false);

  Future<void> initAllItems() async {
    await autoLogin();
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
        hintText: AppTexts.yourSecretPassword,
        keyId: 'password',
        title: AppTexts.password,
        initialValue: password.value ?? '',
        textInputType: TextInputType.visiblePassword,
      ),
    ];
    allItems.refresh();
  }

  void toggleVisibilityPassword() {
    isPasswordVisible.toggle();
  }
 Future<void> autoLogin() async {
    try{
      await getUserFromApiUseCase();
      consoleLog('User already logged in: ${user.value?.email}');
    }catch(e){
      consoleLog('user is not logged in');
      showFailureSnackBar(fallbackMessage: 'from controller ${e.toString()}');
    }
  }

  Future<void> loginUser() async {
    final user = toUserViewModel();
    if (user == null) {
      showFailureSnackBar(failure: Failure.error(AppTexts.emailOrPasswordEmpty));
      return;
    }
    final params = AuthLoginParams(email: user.email ?? '', password: user.password ?? '');
    final either = await authLoginUseCase(params);
    either.fold((failure) => showFailureSnackBar(failure: failure), (response) async {
      showFailureSnackBar(isError: false, fallbackMessage: 'you have logged in Mr ');
     await getUserFromApi();
    });
  }

  UserViewModel? toUserViewModel() {
    String getValueByKeyId(String keyId) {
      final item =
          allItems.firstWhere(
                (element) => element is TextFieldViewModel && element.keyId == keyId,
                orElse: () => TextFieldViewModel(title: '', initialValue: '', hintText: ''),
              )
              as TextFieldViewModel;

      return item.placeholder;
    }

    final email = getValueByKeyId('email');
    final password = getValueByKeyId('password');
    return UserViewModel(email: email, password: password);
  }

  Future<void> getUserFromApi() async {
    getUserFromApiUseCase.call().then((result) {
      result.fold(
        (failure) {
          consoleLog('here error');
          showFailureSnackBar(failure: failure);
        },
        (entity) {
          user.value=UserViewModel(name: entity.name, surname: entity.surname, email: entity.email);

          consoleLog('entity getUserFromApi ${entity.email}');
          consoleLog('Succesfully login ${entity.name}');
          Get.offAllNamed('/home');
        },
      );
    });
  }
}
