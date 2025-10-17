import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../controllers/nomenclature_controller.dart';
import '../../../view/country_flag_dial_code_view_model.dart';
import '../../delivery_address_page/widgets/selection_widget.dart';

class PhoneNumberViewModel extends BaseViewModel {
  CountryFlagDialCodeViewModel selectedFlagDial;

  String? initialValueTextField;
  final String title;

  PhoneNumberViewModel({
    required this.selectedFlagDial,

    required this.title,
    required this.initialValueTextField,
  });
}

class PhoneNumberWidget extends StatefulWidget {
  final PhoneNumberViewModel itemViewModel;
  final NomenclatureController nomenclatureController;

  const PhoneNumberWidget({
    super.key,
    required this.itemViewModel,
    required this.nomenclatureController,
  });

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  late CountryFlagDialCodeViewModel selectedFlagDial;
  late CountryWithPhoneCode selectedCountryLibPhone;
  late TextEditingController textController;
  bool keepCursorAtEnd = true;

  @override
  void initState() {
    super.initState();

    selectedFlagDial =
        widget.nomenclatureController.countriesFlagsDialCode.isNotEmpty
        ? widget.nomenclatureController.countriesFlagsDialCode.first
        : CountryFlagDialCodeViewModel(
            countryCode: 'US',
            countryFlag: '🇺🇸',
            countryDialCode: '1',
            countryName: 'United States',
          );

    selectedCountryLibPhone = widget.nomenclatureController.countries
        .firstWhere(
          (c) =>
              c.countryCode.toUpperCase() ==
              selectedFlagDial.countryFlag.toUpperCase(),
          orElse: () => const CountryWithPhoneCode.us(),
        );

    textController = TextEditingController(
      text: widget.itemViewModel.initialValueTextField,
    );
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
    final sortedFlags = widget.nomenclatureController.countriesFlagsDialCode
      ..sort((a, b) => a.countryName.compareTo(b.countryName));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.itemViewModel.title),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: SelectionWidget<CountryFlagDialCodeViewModel>(
                itemViewModel: SelectionViewModel<CountryFlagDialCodeViewModel>(
                  options: sortedFlags,
                  initialValue: selectedFlagDial,
                ),
                displayText: (item) =>
                    '${item.countryFlag} (+${item.countryDialCode})',
                onSelectionChanged: (selectedItem) {
                  final newCountry = widget.nomenclatureController.countries
                      .firstWhere(
                        (c) =>
                            c.countryCode.toUpperCase() ==
                            selectedItem.countryFlag.toUpperCase(),
                        orElse: () => selectedCountryLibPhone,
                      );
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
              child: TextField(
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
                decoration: const InputDecoration(
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
