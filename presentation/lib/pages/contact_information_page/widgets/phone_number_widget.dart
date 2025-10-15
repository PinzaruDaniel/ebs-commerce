import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/dial_codes_view_model.dart';
import 'package:presentation/view/flag_view_model.dart';

import '../../delivery_address_page/widgets/selection_widget.dart';

class PhoneNumberViewModel extends BaseViewModel {
  final List<DialCodesViewModel> dialCodes;
  final List<FlagViewModel> flags;
  final TextFieldViewModel textFieldViewModel;
  final SelectionViewModel selectionViewModel;
  DialCodesViewModel selectedDialCode;
  final String title;

  PhoneNumberViewModel({
    required this.dialCodes,
    required this.flags,
    required this.textFieldViewModel,
    required this.selectionViewModel,
    required this.selectedDialCode,
    required this.title,
  });
}

class PhoneNumberWidget extends StatefulWidget {
  final PhoneNumberViewModel itemViewModel;

  const PhoneNumberWidget({super.key, required this.itemViewModel});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.itemViewModel.title),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
/*
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  items: widget.itemViewModel.dialCodes.map((code) {
                    return DropdownMenuItem<DialCodesViewModel>(
                      value: code,
                      child: Row(
                        children: [
                          Text(
                            '${_getUnicodeFlag(code.code)} ${code.code} ${code.dialCode}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  value: widget.itemViewModel.selectedDialCode,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        widget.itemViewModel.selectedDialCode = value;
                      });
                    }
                  },
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
*/
            SelectionWidget(
              itemViewModel: widget.itemViewModel.selectionViewModel,
              onSelectionChanged: (selectedCountry) {
                final dialCodeMatch = RegExp(r'\((.*?)\)').firstMatch(selectedCountry);
                final dialCode = dialCodeMatch?.group(1) ?? widget.itemViewModel.selectedDialCode.code;
                setState(() {
                  widget.itemViewModel.selectedDialCode = widget.itemViewModel.dialCodes.firstWhere(
                        (d) => d.code == dialCode,
                    orElse: () => widget.itemViewModel.selectedDialCode,
                  );
                });
              },
            ),
            const SizedBox(width: 8),

            Expanded(
              child: TextFieldWidget(
                itemViewModel: widget.itemViewModel.textFieldViewModel,
                showTitle: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getUnicodeFlag(String countryCode) {
    final flag = widget.itemViewModel.flags.firstWhere(
          (f) => f.iso2 == countryCode,
      orElse: () => FlagViewModel(iso2: '', unicodeFlag: '🏳️'),
    );
    return flag.unicodeFlag;
  }

}
