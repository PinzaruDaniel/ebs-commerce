import 'package:common/constants/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/greeting_page/greeting_page.dart';
import 'package:presentation/pages/home_page/widgets/language_dropdown_widget.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../../controllers/controller_imports.dart';
import '../../../util/resources/app_colors.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../util/resources/app_texts.dart';
import '../../../util/routing/app_pop_up.dart';
import '../../../util/routing/app_router.dart';
import '../../../util/widgets/base/base_button_widget.dart';

class UserMenuWidget extends StatefulWidget {
  const UserMenuWidget({super.key});

  @override
  State<UserMenuWidget> createState() => _UserMenuWidgetState();
}

class _UserMenuWidgetState extends State<UserMenuWidget> {
  UserViewModel? get userVm => currentUserController.userVM.value;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: Get.width * 0.8,
          color: Colors.white,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                    color: AppColors.primary,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            height: 100,
                            width: 100,
                            userVm?.imageUrl ?? 'https://cdn-icons-png.flaticon.com/512/6522/6522516.png',
                          ),
                        ),
                      ),
                      Text(
                        '${userVm?.name ?? 'User'} ${userVm?.surname ?? ''} ',
                        style: AppTextsStyle.bold(color: Colors.white),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              SizedBox(width: 4),
                              if (currentUserController.isUserLogged.value) ...[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${AppTexts.address}:',
                                        style: AppTextsStyle.bold(size: 14, color: Colors.white),
                                      ),
                                      SizedBox(height: 8),

                                      Text(
                                        '${userVm?.deliveryAddressViewModel?.country ?? ''}, ${userVm?.deliveryAddressViewModel?.city ?? ''} ',
                                        style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                      ),
                                      SizedBox(height: 4),

                                      Text(
                                        userVm?.deliveryAddressViewModel?.address ?? '',
                                        style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(color: Colors.white, thickness: 2),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Personal:', style: AppTextsStyle.bold(size: 14, color: Colors.white)),
                                      SizedBox(height: 8),
                                      Expanded(
                                        child: Text(
                                          userVm?.email ?? '',
                                          style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '${userVm?.dialCode ?? ''} ${userVm?.number ?? ''} ',
                                        style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person, color: Colors.black),
                        title: Text('My Profile', style: AppTextsStyle.bold()),
                        onTap: () => AppRouter.openProfilePageNoAnim(),
                      ),

                      LanguageDropdown(),

                      ListTile(
                        leading: const Icon(Icons.exit_to_app_rounded, color: Colors.black),
                        title: Text('Log out', style: AppTextsStyle.bold()),
                        onTap: () async {
                          AppPopUp.showConfirmationDialog(
                            title: 'Are you sure you want to log out?',
                            content: 'This will delete all saved data',
                            context: context,
                            onSave: () async {
                              await currentUserController.clearUserData();
                              currentUserController.deleteTokens();
                              Get.off(GreetingPage());
                            },

                          );

                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              if (!currentUserController.isUserLogged.value) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BaseButtonWidget(
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    onTap: () {},
                    title: AppTexts.signUp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BaseButtonWidget(
                    buttonColor: AppColors.primary,
                    textColor: Colors.white,
                    onTap: () {
                      AppRouter.openAuthPage();
                    },
                    title: AppTexts.logIn,
                  ),
                ),
              ] else
                SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
