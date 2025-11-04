import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';
import 'package:presentation/util/widgets/select_checkbox_widget.dart';

import '../../util/resources/app_icons.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppIcons.ebsIcon,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Text(
                'EBS e-commerce is your platform for every your wish',
                style: AppTextsStyle.bold(size: 36),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 50.0, top: 60, left: 24, right: 24),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: (){
                  setState(() {
                    isChecked=!isChecked;
                  });
                },
                child: SelectCheckboxWidget(
                  title: 'I agree with EBS App User Terms And Conditions and acknowledge the TFH Privacy notice',
                  selected: isChecked,
                  selectedColor: Colors.black,
                  tristate: false,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  textStyle: AppTextsStyle.medium.copyWith(color: AppColors.greyText, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  BaseButtonWidget(
                    buttonColor: isChecked ? AppColors.primary : Colors.grey.shade300,
                    textColor: isChecked ? Colors.white : Colors.grey,
                    onTap: () {
                      AppPopUp.showConfirmationDialog(context: context, content: '', title: 'It is in progress');
                    },
                    title: 'Sign up',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: BaseButtonWidget(
                      buttonColor: Colors.grey.shade300,
                      textColor: isChecked ? Colors.black : Colors.grey,
                      onTap: () {
                        isChecked
                            ? AppRouter.openAuthPage()
                            : AppPopUp.showConfirmationDialog(
                                context: context,
                                content: '',
                                title: 'Please, check the box',
                              );
                      },
                      title: 'Log in',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
