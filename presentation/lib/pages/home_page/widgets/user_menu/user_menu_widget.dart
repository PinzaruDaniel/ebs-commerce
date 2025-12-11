import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/greeting_page/greeting_page.dart';
import 'package:presentation/pages/home_page/widgets/user_menu/widgets/delivery_address_widget.dart';
import 'package:presentation/pages/home_page/widgets/user_menu/widgets/user_info_widget.dart';
import 'package:presentation/util/mixins/user_mixins.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/language_dropdown_widget.dart';
import 'package:presentation/view/user_view_model.dart';

import '../../../../controllers/controller_imports.dart';
import '../../../../util/resources/app_colors.dart';
import '../../../../util/resources/app_text_styles.dart';
import '../../../../util/resources/app_texts.dart';
import '../../../../util/routing/app_pop_up.dart';
import '../../../../util/routing/app_router.dart';
import '../../../../util/widgets/base/base_button_widget.dart';

class UserMenuWidget extends StatefulWidget {
  final Function onAuth;

  const UserMenuWidget({super.key, required this.onAuth});

  @override
  State<UserMenuWidget> createState() => _UserMenuWidgetState();
}

class _UserMenuWidgetState extends State<UserMenuWidget> with LoginFunctions {
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
              Expanded(
                flex: 0,
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
                          child: Image.network(height: 100, width: 100, userVm?.imageUrl ?? AppIcons.noProfilePicture),
                        ),
                      ),
                      Text(
                        '${userVm?.name ?? AppTexts.userLabel} ${userVm?.surname ?? ''} ',
                        style: AppTextsStyle.bold(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              SizedBox(width: 4),
                              if (currentUserController.isUserLogged.value) ...[
                                if (currentUserController.userVM.value?.deliveryAddressViewModel?.country != null) ...[
                                  DeliveryAddressWidget(userVm: userVm),
                                  VerticalDivider(color: Colors.white, thickness: 2),
                                ],
                                SizedBox(width: 8),
                                UserInfoWidget(userVm: userVm),
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
                        leading: SizedBox(height: 24, width: 24, child: AppIcons.orderIcon),
                        title: Text(AppTexts.myOrders, style: AppTextsStyle.bold()),
                        onTap: () => AppRouter.openOrdersPage(),
                      ),
                      LanguageDropdown(),
                      if (currentUserController.isUserLogged.value)
                        ListTile(
                          leading: const Icon(Icons.exit_to_app_rounded, color: Colors.black),
                          title: Text(AppTexts.logOut, style: AppTextsStyle.bold()),
                          onTap: () async {
                            logOut(onAuth: widget.onAuth);
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
                    onTap: () async {
                      await widget.onAuth.call();
                      AppRouter.openAuthPage(goBackToPage: false, removeUntil: true);
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
