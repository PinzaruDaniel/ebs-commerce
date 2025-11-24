import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/set_delivery_address_use_case.dart';
import 'package:domain/modules/user_information/use_cases/sync_user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/mapper/delivery_address_mapper.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:snackify/enums/snack_enums.dart';

import '../../util/resources/app_texts.dart';
import '../../util/routing/app_pop_up.dart';
import '../../view/user_view_model.dart';

class AuthentificationController extends GetxController {
  AuthLoginUseCase authLoginUseCase = GetIt.instance<AuthLoginUseCase>();
  SyncUserUseCase syncUserUseCase = GetIt.instance<SyncUserUseCase>();
  final SetDeliveryAddressUseCase setDeliveryAddressUseCase = GetIt.instance<SetDeliveryAddressUseCase>();

  RxList<BaseViewModel> allItems = RxList([]);
  RxBool isPasswordVisible = RxBool(false);

  Future<void> initAllItems() async {
    allItems.value = [
      TextFieldViewModel(
        hintText: 'pinzaru.daniel@gmail.com',
        keyId: 'email',
        title: AppTexts.email,
        textInputType: TextInputType.emailAddress,
        initialValue: '',
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
        initialValue: '',
        textInputType: TextInputType.visiblePassword,
        customValidator: (text) {
          if (text == null || text.isEmpty) {
            return AppTexts.emailIsRequired;
          }
          return null;
        },
      ),
    ];
    allItems.refresh();
  }

  void toggleVisibilityPassword() {
    isPasswordVisible.toggle();
  }

  Future<void> loginUser({required Function onSuccess, required Function onError}) async {
    mainAppController.addPendingIds([PendingIds.logIn]);
    String? getValueByKeyId(String keyId) {
      final item =
          allItems.firstWhere(
                (element) => element is TextFieldViewModel && element.keyId == keyId,
                orElse: () => TextFieldViewModel(title: '', initialValue: '', hintText: ''),
              )
              as TextFieldViewModel;
      return item.placeholder;
    }

    var email = getValueByKeyId('email') ?? '';
    var password = getValueByKeyId('password') ?? '';

    if (email.isEmpty || password.isEmpty) {
      AppPopUp.showFailureSnackBar(fallbackMessage: AppTexts.emailOrPasswordEmpty);
      mainAppController.removePendingIds([PendingIds.logIn]);
      return;
    }
    await authLoginUseCase(AuthLoginParams(email: email, password: password)).then((either) {
      either.fold(
        (failure) {
          allItems.refresh();
          mainAppController.removePendingIds([PendingIds.logIn]);
          consoleLog('User is not logged in, error');
          onError.call();
        },
        (response) async {
          onSuccess.call();
        },
      );
    });
    await syncUser();
  }

  Future<void> syncUser() async {
    await syncUserUseCase.call().then((result) {
      result.fold(
        (failure) {
          consoleLog('User is not logged in');
          mainAppController.removePendingIds([PendingIds.logIn]);
        },
        (entity) {
          currentUserController.userVM.value = UserViewModel(
            name: entity.name,
            surname: entity.surname,
            email: entity.email,
            imageUrl: entity.imageUrl,
            deliveryAddressViewModel: entity.deliveryAddressEntity?.toModel,
          );
          setDeliveryAddressUseCase(
            SetDeliveryAddressParams(
              deliveryAddressEntity: entity.deliveryAddressEntity!,
              idUser: currentUserController.userVM.value?.idUser ?? 1,
            ),
          );
          consoleLog('User already logged in: ${currentUserController.userVM.value?.email}');
          consoleLog('Successfully auto-logged in ${entity.name}');
          mainAppController.removePendingIds([PendingIds.logIn]);
        },
      );
    });
  }
}
