import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/dial_codes_view_model.dart';
import 'package:presentation/view/flag_view_model.dart';
import 'package:flutter/material.dart';
import '../../delivery_address_page/widgets/selection_widget.dart';

class PhoneNumberViewModel extends BaseViewModel {
  final List<DialCodesViewModel> dialCodes;
  final List<FlagViewModel> flags;
  final TextFieldViewModel textFieldViewModel;
  DialCodesViewModel selectedDialCode;
  final String title;

  PhoneNumberViewModel({
    required this.dialCodes,
    required this.flags,
    required this.textFieldViewModel,
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
            Expanded(
              flex: 0,
              child: SelectionWidget(
                showTitle: false,
                itemViewModel: SelectionViewModel(
                  title: '',
                  options: widget.itemViewModel.dialCodes.map((e) => e.dialCode).toList(),
                  initialValue: widget.itemViewModel.selectedDialCode.dialCode,
                ),
                onSelectionChanged: (selectedCountry) {
                  final dial = widget.itemViewModel.dialCodes.firstWhere(
                        (d) => d.code == selectedCountry || d.code == selectedCountry,
                    orElse: () => widget.itemViewModel.selectedDialCode,
                  );

                  setState(() {
                    widget.itemViewModel.selectedDialCode = dial;
                  });
                },
              ),
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
