import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/dial_codes_view_model.dart';
import 'package:presentation/view/flag_view_model.dart';
import 'package:flutter/material.dart';

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
        SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButton<DialCodesViewModel>(
                  iconSize: 20,
                  value: widget.itemViewModel.dialCodes.contains(widget.itemViewModel.selectedDialCode)
                      ? widget.itemViewModel.selectedDialCode
                      : widget.itemViewModel.dialCodes.first,
                  underline: const SizedBox(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        widget.itemViewModel.selectedDialCode = value;
                      });
                    }
                  },
                  items: widget.itemViewModel.dialCodes.map((code) {
                    return DropdownMenuItem<DialCodesViewModel>(
                      value: code,
                      child: Text('${_getUnicodeFlag(code.code)} ${code.dialCode}'),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(child: TextFieldWidget(itemViewModel: widget.itemViewModel.textFieldViewModel, showTitle: false,)),
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
