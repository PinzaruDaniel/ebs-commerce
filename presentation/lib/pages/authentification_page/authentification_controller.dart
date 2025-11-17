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
import 'package:presentation/util/mapper/delivery_address_mapper.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../util/resources/app_texts.dart';
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
          if (text == null || text.isEmpty) return AppTexts.emailIsRequired;
          return null;
        },
      ),
    ];
    allItems.refresh();
  }

  void toggleVisibilityPassword() {
    isPasswordVisible.toggle();
  }

  Future<void> loginUser() async {
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
      showFailureSnackBar(failure: Failure.error(AppTexts.emailOrPasswordEmpty));
      return;
    }

    final params = AuthLoginParams(email: email, password: password);
    final either = await authLoginUseCase(params);
    either.fold((failure) => showFailureSnackBar(failure: failure), (response) async {
      Get.offAllNamed('/home');
    });
    final result = await syncUserUseCase.call();
    result.fold(
      (failure) {
        consoleLog('User is not logged in');
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
      },
    );
  }
}
