import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../controllers/controller_imports.dart';
import '../../../util/resources/app_icons.dart';
import '../../../util/widgets/selection_widget.dart';
import '../../../view/country_flag_dial_code_view_model.dart';

class PhoneNumberViewModel extends BaseViewModel {
  CountryFlagDialCodeViewModel selectedFlagDial;
  String? initialValueTextField;
  final String title;

  PhoneNumberViewModel({required this.selectedFlagDial, required this.title, required this.initialValueTextField});
}

class PhoneNumberWidget extends StatefulWidget {
  final PhoneNumberViewModel itemViewModel;

  const PhoneNumberWidget({super.key, required this.itemViewModel});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  CountryFlagDialCodeViewModel selectedFlagDial = CountryFlagDialCodeViewModel(
    name: '',
    iso2: '',
    flag: '🏳️',
    dialCode: '',
    phoneMaskMobileInternational: '',
    exampleNumberMobileInternational: '',
  );

  CountryWithPhoneCode selectedCountryLibPhone = const CountryWithPhoneCode.us();
  TextEditingController textController = TextEditingController();
  String? parsedData;

  @override
  void initState() {
    super.initState();
    selectedFlagDial = widget.itemViewModel.selectedFlagDial;

    selectedCountryLibPhone =
        nomenclatureController.countries.firstWhereOrNull(
          (c) => c.countryCode.toUpperCase() == selectedFlagDial.iso2.toUpperCase(),
        ) ??
        const CountryWithPhoneCode.us();

    textController.text = widget.itemViewModel.initialValueTextField ?? '';

    textController.addListener(() {
      widget.itemViewModel.initialValueTextField = textController.text;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.itemViewModel.title),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SelectionWidget<CountryFlagDialCodeViewModel>(
                itemViewModel: SelectionViewModel<CountryFlagDialCodeViewModel>(
                  showTitle: false,
                  title: AppTexts.country,
                  displayText: (option) => Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: AppIcons.countryFlag(iso2: selectedFlagDial.iso2.toLowerCase())),
                      SizedBox(width: 4,),
                      Text('+${selectedFlagDial.dialCode}'),
                    ],
                  ),
                  options: nomenclatureController.countriesFlagsDialCode.value
                      .map(
                        (e) => OptionViewModel<CountryFlagDialCodeViewModel>(
                          data: e,
                          titleKey: '${e.name}  (+${e.dialCode})',
                        ),
                      )
                      .toList(),
                  initialValue: OptionViewModel(
                    data: selectedFlagDial,
                    titleKey: '${selectedFlagDial.flag} ${selectedFlagDial.name} (+${selectedFlagDial.dialCode})',
                  ),
                ),
                onSelect: (OptionViewModel selectedOption) {
                  final selectedItem = selectedOption.data;

                  final newCountry =
                      nomenclatureController.countries.firstWhereOrNull(
                        (c) => c.countryCode.toUpperCase() == selectedItem.iso2.toUpperCase(),
                      ) ??
                      const CountryWithPhoneCode.us();

                  setState(() {
                    selectedFlagDial = selectedItem;
                    widget.itemViewModel.selectedFlagDial = selectedItem;
                    selectedCountryLibPhone = newCountry;
                    textController.clear();
                    widget.itemViewModel.initialValueTextField = '';
                  });
                },
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 2,
              child: TextFieldWidget(
                itemViewModel: TextFieldViewModel(
                  hintText: selectedFlagDial.exampleNumberMobileInternational,
                  keyId: 'phone',
                  textInputType: TextInputType.phone,
                  textController: textController,
                  countryCode: selectedFlagDial.iso2,
                  inputFormatter: [
                    LibPhonenumberTextFormatter(
                      phoneNumberType: PhoneNumberType.mobile,
                      phoneNumberFormat: PhoneNumberFormat.international,
                      country: selectedCountryLibPhone,
                      shouldKeepCursorAtEndOfInput: true,
                      inputContainsCountryCode: false,
                    ),
                  ],
                  customValidator: (text) {
                    if (text == null || text.isEmpty) {
                      return AppTexts.numberIsRequired;
                    }

                    final mask = selectedCountryLibPhone.phoneMaskMobileInternational;
                    final firstSpaceIndex = mask.indexOf(' ');
                    final nationalMask = firstSpaceIndex != -1 ? mask.substring(firstSpaceIndex + 1) : mask;
                    final expectedDigits = RegExp(r'0').allMatches(nationalMask).length;
                    final digitsOnly = text.replaceAll(RegExp(r'\D'), '');

                    if (digitsOnly.length != expectedDigits) {
                      return '${AppTexts.requiredNumberDigits} $expectedDigits';
                    }

                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
