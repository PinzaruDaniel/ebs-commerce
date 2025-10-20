import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:get/get.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import '../../../controllers/controller_imports.dart';
import '../../../view/country_flag_dial_code_view_model.dart';
import '../../delivery_address_page/widgets/selection_widget.dart';

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
  late CountryFlagDialCodeViewModel selectedFlagDial;
  late CountryWithPhoneCode selectedCountryLibPhone;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    selectedFlagDial = widget.itemViewModel.selectedFlagDial;
    selectedCountryLibPhone =
        nomenclatureController.countries.firstWhereOrNull(
          (c) => c.countryCode.toUpperCase() == selectedFlagDial.countryCode.toUpperCase(),
        ) ??
        const CountryWithPhoneCode.us();

    textController = TextEditingController(text: widget.itemViewModel.initialValueTextField);
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
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Text(widget.itemViewModel.title),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: SelectionWidget<CountryFlagDialCodeViewModel>(
                itemViewModel: SelectionViewModel<CountryFlagDialCodeViewModel>(
                  displayText: (option) => '${selectedFlagDial.countryFlag} +(${selectedFlagDial.countryDialCode})',
                  options: nomenclatureController.countriesFlagsDialCode.value.map((e) {
                    return OptionViewModel(
                      data: e,
                      titleKey: '${e.countryFlag} ${e.countryName} (+${e.countryDialCode})',
                    );
                  }).toList(),
                  initialValue: OptionViewModel(
                    data: nomenclatureController.countriesFlagsDialCode.value.first,
                    titleKey:
                        '${nomenclatureController.countriesFlagsDialCode.value.first.countryFlag} ${nomenclatureController.countriesFlagsDialCode.value.first.countryName} (+${nomenclatureController.countriesFlagsDialCode.value.first.countryDialCode})',
                  ),
                ),
                onSelectionChanged: (OptionViewModel selectedOption) {
                  final selectedItem = selectedOption.data;

                  final newCountry = nomenclatureController.countries.firstWhereOrNull(
                    (c) => c.countryCode.toUpperCase() == selectedItem.countryCode.toUpperCase(),
                  );

                  setState(() {
                    selectedFlagDial = selectedItem;
                    widget.itemViewModel.selectedFlagDial = selectedItem;
                    selectedCountryLibPhone = newCountry ?? const CountryWithPhoneCode.us();
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
                  keyId: 'phone',
                  textInputType: TextInputType.phone,
                  textController: textController,
                  inputFormatter: [
                    LibPhonenumberTextFormatter(
                      phoneNumberType: PhoneNumberType.mobile,
                      phoneNumberFormat: PhoneNumberFormat.national,
                      country: selectedCountryLibPhone,
                      shouldKeepCursorAtEndOfInput: true,
                      inputContainsCountryCode: false,
                    ),
                  ],
                ),
              ),

              /*TextField(
                controller: textController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LibPhonenumberTextFormatter(
                    phoneNumberType: PhoneNumberType.mobile,
                    phoneNumberFormat: PhoneNumberFormat.national,
                    country: selectedCountryLibPhone,
                    shouldKeepCursorAtEndOfInput: keepCursorAtEnd,
                    inputContainsCountryCode: false,
                  ),
                ],
                decoration: InputDecoration(
                  hintText: selectedCountryLibPhone.exampleNumberMobileNational,
                  border: OutlineInputBorder(),
                ),
              ),*/
            ),
          ],
        ),
      ],
    );
  }
}
