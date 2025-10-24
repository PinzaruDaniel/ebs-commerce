import 'package:flutter/cupertino.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';

import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';
import 'bottom_navigation_bar_widget.dart';

class VoucherCodeInputWidget extends StatefulWidget {
  final String initialValue;
  final void Function(String) onSubmit;

  const VoucherCodeInputWidget({super.key, required this.initialValue, required this.onSubmit});

  @override
  State<VoucherCodeInputWidget> createState() => _VoucherCodeInputWidgetState();
}

class _VoucherCodeInputWidgetState extends State<VoucherCodeInputWidget> {
  TextFieldViewModel textViewModel = TextFieldViewModel();

  @override
  void initState() {
    super.initState();
    textViewModel = TextFieldViewModel(title: '', initialValue: widget.initialValue, textInputType: TextInputType.text, isRequiredValidation: false);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text(AppTexts.enterVoucher, style: AppTextsStyle.bold(size: 18))),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 24),
                  child: TextFieldWidget(itemViewModel: textViewModel, ),
                ),
                BottomNavigationBarWidget(
                  title: AppTexts.save,
                  onTap: () => widget.onSubmit(textViewModel.placeholder.trim()),
                  showIcon: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
