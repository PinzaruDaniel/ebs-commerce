import 'package:common/constants/logger.dart';
import 'package:domain/modules/delivery_address/use_cases/dial_codes/get_dial_codes_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/contact_information_page/widgets/phone_number_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/dial_codes_view_model.dart';
import 'package:presentation/view/flag_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../controllers/controller_imports.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/text_field_widget.dart';
import '../../view/country_flag_dial_code_view_model.dart';

class ContactInformationController extends GetxController {
  final GetDialCodesUseCase getDialCodesUseCase = GetIt.instance<GetDialCodesUseCase>();
  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();
  RxList<DialCodesViewModel> dialCodes = RxList([]);
  RxList<FlagViewModel> flags = RxList([]);
  Rxn<DialCodesViewModel> selectedDialCode = Rxn<DialCodesViewModel>();

  Future<void> initAllItems(UserViewModel? userViewModel) async {
    user.value = userViewModel;
    CountryFlagDialCodeViewModel codeViewModel;

    if (user.value?.dialCode != null) {
      final userDialCode = user.value!.dialCode?.replaceAll('+', '');
      codeViewModel = nomenclatureController.countriesFlagsDialCode.value.firstWhere(
            (flag) => flag.dialCode == userDialCode,
        orElse: () => CountryFlagDialCodeViewModel(
          iso2: 'US',
          name: 'United States',
          dialCode: '1',
          phoneMaskMobileInternational: '+0 000-000-0000',
          exampleNumberMobileInternational: '1 201-555-0123',
        ),
      );
    } else {
      codeViewModel = nomenclatureController.countriesFlagsDialCode.value.isNotEmpty
          ? nomenclatureController.countriesFlagsDialCode.value.first
          : CountryFlagDialCodeViewModel(
        iso2: 'US',
        name: 'United States',
        dialCode: '1',
        phoneMaskMobileInternational: '+0 000-000-0000',
        exampleNumberMobileInternational: '1 201-555-0123',
      );
    }
    allItems.value = [
      TextFieldViewModel(
        hintText: 'Pinzaru',
        keyId: 'name',
        title: AppTexts.name,
        initialValue: user.value?.name ?? '',
        customValidator: (text) {
          if (text == null || text.isEmpty) return AppTexts.requiredField;
          if (text.length < 3 || text.length > 15) {
            return '${AppTexts.requiredLettersBetween} 3-15 ${AppTexts.letters} ';
          }
          final regex = RegExp(r'^[a-zA-Z]+$');
          if (!regex.hasMatch(text)) {
            return AppTexts.nameMustContainOnlyLetters;
          }
          return null;
        },
      ),
      TextFieldViewModel(
        hintText: 'Daniel',
        keyId: 'surname',
        title: AppTexts.surname,
        initialValue: user.value?.surname ?? '',
        customValidator: (text) {
          if (text == null || text.isEmpty) return AppTexts.requiredField;
          if (text.length < 3 || text.length > 15) {
            return '${AppTexts.requiredLettersBetween} 3-15 ${AppTexts.letters} ';
          }
          final regex = RegExp(r'^[a-zA-Z]+$');
          if (!regex.hasMatch(text)) {
            return AppTexts.surnameMustContainOnlyLetters;
          }
          return null;
        },
      ),
      PhoneNumberViewModel(
        title: AppTexts.phone,
        initialValueTextField: user.value?.number ?? '',
        selectedFlagDial: codeViewModel
      ),

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
    ];
  }

  UserViewModel? toUserViewModel() {
    String getPlaceholderByKeyId(String keyId) {
      final item =
      allItems.firstWhere(
            (element) => element is TextFieldViewModel && element.keyId == keyId,
        orElse: () => TextFieldViewModel(title: '', initialValue: '', hintText: ''),
      )
      as TextFieldViewModel;

      return item.placeholder;
    }
    final phoneItem = allItems.firstWhereOrNull((element) => element is PhoneNumberViewModel) as PhoneNumberViewModel?;
    return user.value = UserViewModel(
      name: getPlaceholderByKeyId('name'),
      surname: getPlaceholderByKeyId('surname'),
      number: phoneItem?.initialValueTextField ?? '',
      dialCode: '+${phoneItem?.selectedFlagDial.dialCode ?? ''}',
      email: getPlaceholderByKeyId('email'),
    );
  }
}
