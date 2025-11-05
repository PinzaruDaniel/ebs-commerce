import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/authentification_page/authentification_controller.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';

class AuthentificationPage extends StatefulWidget {
  const AuthentificationPage({super.key});

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  final AuthentificationController authController = Get.put(AuthentificationController());

  @override
  void initState() {
    super.initState();
    Get.put(AuthentificationController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.initAllItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Text('Log in', style: AppTextsStyle.bold(size: 30)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0, top: 8),
                  child: Text(
                    'Welcome back, enter your details \nto access your account',
                    style: AppTextsStyle.medium.copyWith(color: AppColors.greyText, fontSize: 16),
                  ),
                ),
                Obx(() {
                  final items = authController.allItems.toList();
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      if (item is TextFieldViewModel) {
                        if (item.keyId == 'password') {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Obx(
                              () => TextFieldWidget(
                                obscureText: authController.isPasswordVisible.value,
                                itemViewModel: item,
                                suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    authController.toggleVisibilityPassword();
                                  },
                                  icon: authController.isPasswordVisible.value
                                      ? Icon(Icons.visibility_off_rounded, color: AppColors.greyText)
                                      : Icon(Icons.visibility_rounded, color: AppColors.greyText),
                                ),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFieldWidget(itemViewModel: item),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  );
                }),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        AppRouter.openHomePage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Enter without password',
                          style: AppTextsStyle.medium.copyWith(
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.greyText,
                            shadows: [Shadow(color: AppColors.greyText, offset: Offset(0, -2))],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: BaseButtonWidget(
                    buttonColor: AppColors.primary,
                    textColor: Colors.white,
                    onTap: () {
                      authController.loginUser();
                    },
                    title: 'Log in',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
