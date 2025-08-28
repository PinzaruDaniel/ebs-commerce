import 'package:flutter/cupertino.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';

import '../resources/app_text_styles.dart';
import '../resources/app_texts.dart';
import 'bottom_navigation_bar_widget.dart';

class VoucherCodeInputWidget extends StatelessWidget {
  final Function()? onTap;
  final TextFieldViewModel textViewModel;
  const VoucherCodeInputWidget({super.key, required this.onTap, required this.textViewModel});

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
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
                  child: TextFieldWidget(itemViewModel: textViewModel),
                ),
                BottomNavigationBarWidget(title: AppTexts.save, onTap: onTap, showIcon: false),
              ],
            ),
          ),
        );
      },
    );
  }
}
