import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/authentification_page/authentification_controller.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';
import 'package:presentation/util/widgets/base/base_page.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';


class AuthentificationPage extends StatefulWidget {
  final bool goBackToPage;

  const AuthentificationPage({super.key, this.goBackToPage = true});

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  final AuthentificationController authController = Get.put(AuthentificationController());

  @override
  void initState() {
    super.initState();
    Get.put(AuthentificationController());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await authController.initAllItems();
    });
  }

  @override
  void dispose() {
    Get.delete<AuthentificationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: [PendingIds.logIn],
      appBar: AppBarWidget(showBorder: false, leading: widget.goBackToPage ? null : Container()),
      resizeToAvoidBottomInset: false,
      builder: (context) {
        return Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Text(AppTexts.logIn, style: AppTextsStyle.bold(size: 30)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0, top: 8),
                  child: Text(
                    AppTexts.welcomeBack,
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
                                obscureText: !authController.isPasswordVisible.value,
                                itemViewModel: item,
                                suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    authController.toggleVisibilityPassword();
                                  },
                                  icon: !authController.isPasswordVisible.value
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: BaseButtonWidget(
                    buttonColor: AppColors.primary,
                    textColor: Colors.white,
                    onTap: () async {
                      await authController.loginUser(
                        onSuccess: () {
                          AppRouter.openHomePage(removeUntil: true);
                        },
                        onError: (String errorMessage) {
                          AppPopUp.showFailureSnackBar(fallbackMessage: errorMessage);
                        },
                      );
                    },
                    title: AppTexts.logIn,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
