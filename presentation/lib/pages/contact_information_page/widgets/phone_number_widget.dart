import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/dial_codes_view_model.dart';
import 'package:presentation/view/flag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
            Expanded(
              flex: 0,
              child: SelectionWidget(
                showTitle: false,
                itemViewModel: widget.itemViewModel.selectionViewModel,
                onSelectionChanged: (selectedCountry) {
                  final dialCodeMatch = RegExp(r'\((.*?)\)').firstMatch(selectedCountry);
                  final dialCode = dialCodeMatch != null ? dialCodeMatch.group(1) : widget.itemViewModel.selectedDialCode.code;
                  final dial = widget.itemViewModel.dialCodes.firstWhere(
                        (d) => d.code == dialCode,
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


}
