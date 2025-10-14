import 'package:domain/modules/delivery_address/use_cases/dial_codes/get_dial_codes_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/flags/get_flags_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/contact_information_page/widgets/phone_number_widget.dart';
import 'package:presentation/util/mapper/dial_codes_mapper.dart';
import 'package:presentation/util/mapper/flags_mapper.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/dial_codes_view_model.dart';
import 'package:presentation/view/flag_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../util/resources/app_texts.dart';
import '../../util/widgets/text_field_widget.dart';

class ContactInformationController extends GetxController {
  final GetDialCodesUseCase getDialCodesUseCase = GetIt.instance<GetDialCodesUseCase>();
  final GetFlagsUseCase getFlagsUseCase = GetIt.instance<GetFlagsUseCase>();

  RxList<BaseViewModel> allItems = RxList([]);
  Rxn<UserViewModel> user = Rxn<UserViewModel>();
  RxList<DialCodesViewModel> dialCodes = RxList([]);
  RxList<FlagViewModel> flags = RxList([]);
  Rxn<DialCodesViewModel> selectedDialCode = Rxn<DialCodesViewModel>();
  RxBool isLoading=RxBool(true);



  Future<void> initAllItems() async {
    final existingUser = user.value;
    await getDialCodes();
    await getFlags();
    final selectedDialCode = dialCodes.firstWhere(
          (d) => d.dialCode == existingUser?.dialCode,
      orElse: () => dialCodes.first,
    );
    allItems.value = [
      TextFieldViewModel(keyId: 'name', title: AppTexts.name, initialValue: existingUser?.name ?? ''),
      TextFieldViewModel(keyId: 'surname', title: AppTexts.surname, initialValue: existingUser?.surname ?? ''),
      PhoneNumberViewModel(
        title: AppTexts.phone,
        dialCodes: dialCodes,
        flags: flags,
        selectedDialCode:selectedDialCode,
        textFieldViewModel: TextFieldViewModel(
          keyId: 'phone',
          title: '',
          textInputType: TextInputType.phone,
          initialValue: existingUser?.number ?? '',
          customValidator: (text) {
            if (text == null || text.isEmpty) return AppTexts.numberIsRequired;
            final phoneRegex = RegExp(r'^[1-9][0-9]{7,14}$');
            if (!phoneRegex.hasMatch(text)) return AppTexts.invalidNumberPhone;
            return null;
          },
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

  Future<void> getDialCodes() async {
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
  }

  Future<void> getFlags() async {
    await getFlagsUseCase.call().then((either) {
      either.fold(
        (failure) {
          isLoading.value=false;
          showFailureSnackBar(failure: failure);
        },
        (list) {
          final newItems = list.map((e) => e.toModel).toList();
          flags.assignAll(newItems);
          isLoading.value=false;
        },
      );
    });
  }

  UserViewModel? toUserViewModel() {
    String getPlaceholderByKeyId(String keyId) {
      final item = allItems.firstWhere(
            (element) => element is TextFieldViewModel && element.keyId == keyId,
        orElse: () => TextFieldViewModel(title: '', initialValue: ''),
      ) as TextFieldViewModel;

      return item.placeholder;
    }

    final phoneItem = allItems.firstWhereOrNull(
          (element) => element is PhoneNumberViewModel,
    ) as PhoneNumberViewModel?;
    return user.value = UserViewModel(
      name: getPlaceholderByKeyId('name'),
      surname: getPlaceholderByKeyId('surname'),
      number: phoneItem?.textFieldViewModel.placeholder ?? '',
      dialCode:  phoneItem?.selectedDialCode.dialCode ?? '',
      email: getPlaceholderByKeyId('email'),
    );

  }

}
