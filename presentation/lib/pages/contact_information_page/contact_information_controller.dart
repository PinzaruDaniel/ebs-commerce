import 'package:domain/modules/delivery_address/use_cases/dial_codes/get_dial_codes_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/flags/get_flags_use_case.dart';
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
  final GetDialCodesUseCase getDialCodesUseCase =
      GetIt.instance<GetDialCodesUseCase>();

  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();
  RxList<DialCodesViewModel> dialCodes = RxList([]);
  RxList<FlagViewModel> flags = RxList([]);
  Rxn<DialCodesViewModel> selectedDialCode = Rxn<DialCodesViewModel>();
  RxBool isLoading = RxBool(false);

  Future<void> initAllItems() async {
    final existingUser = user.value;
    allItems.value = [
      TextFieldViewModel(
        keyId: 'name',
        title: AppTexts.name,
        initialValue: existingUser?.name ?? '',
      ),
      TextFieldViewModel(
        keyId: 'surname',
        title: AppTexts.surname,
        initialValue: existingUser?.surname ?? '',
      ),
      PhoneNumberViewModel(
        title: AppTexts.phone,
        initialValueTextField: existingUser?.number ?? '',
        selectedFlagDial:
            nomenclatureController.countriesFlagsDialCode.isNotEmpty
            ? nomenclatureController.countriesFlagsDialCode.first
            : CountryFlagDialCodeViewModel(
                countryCode: 'US',
                countryFlag: '🇺🇸',
                countryName: 'United States',
                countryDialCode: '1',
              ),
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

  /*  Future<void> getDialCodes() async {
    await getDialCodesUseCase.call().then((either) {
      either.fold(
        (failure) {
          showFailureSnackBar(failure: failure);
        },
        (list) {
          final newItems = list.map((e) => e.toModel).toList();
          dialCodes.assignAll(newItems);
        },
      );
    });
  }*/

  UserViewModel? toUserViewModel() {
    String getPlaceholderByKeyId(String keyId) {
      final item =
          allItems.firstWhere(
                (element) =>
                    element is TextFieldViewModel && element.keyId == keyId,
                orElse: () => TextFieldViewModel(title: '', initialValue: ''),
              )
              as TextFieldViewModel;

      return item.placeholder;
    }

    final phoneItem =
        allItems.firstWhereOrNull((element) => element is PhoneNumberViewModel)
            as PhoneNumberViewModel?;
    print('phone number ${phoneItem?.initialValueTextField}');
    return user.value = UserViewModel(
      name: getPlaceholderByKeyId('name'),
      surname: getPlaceholderByKeyId('surname'),
      number: phoneItem?.initialValueTextField ?? '',
      dialCode: phoneItem?.selectedFlagDial.countryDialCode ?? '',
      email: getPlaceholderByKeyId('email'),
    );
  }

  String getUnicodeFlag(String countryCode) {
    final flag = flags.firstWhere(
      (f) => f.iso2 == countryCode,
      orElse: () => FlagViewModel(iso2: '', unicodeFlag: '🏳️', name: 'null'),
    );
    return flag.unicodeFlag;
  }
}
