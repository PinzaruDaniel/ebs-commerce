import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/widgets/language_dropdown_widget.dart';
import 'package:presentation/pages/profile_page/profile_page.dart';

import '../../../controllers/controller_imports.dart';
import '../../../util/resources/app_colors.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../util/resources/app_texts.dart';
import '../../../util/routing/app_router.dart';
import '../../../util/widgets/base/base_button_widget.dart';
import '../../../util/widgets/open_container_animation_widget.dart';

class UserMenuWidget extends StatelessWidget {
  const UserMenuWidget({super.key});

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
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  color: AppColors.primary,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.0, bottom: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          height: 100,
                          width: 100,
                          currentUserController.userVM.value?.imageUrl ??
                              'https://cdn-icons-png.flaticon.com/512/6522/6522516.png',
                        ),
                      ),
                    ),
                    Text(
                      '${currentUserController.userVM.value?.name ?? 'User'} ${currentUserController.userVM.value?.surname ?? ''} ',
                      style: AppTextsStyle.bold(color: Colors.white),
                    ),
                    Spacer(),
                    IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '${AppTexts.address}:',
                                    style: AppTextsStyle.bold(size: 14, color: Colors.white),
                                  ),
                                  Text(
                                    '${currentUserController.userVM.value?.deliveryAddressViewModel?.country ?? ''}, ${currentUserController.userVM.value?.deliveryAddressViewModel?.city ?? ''} ',
                                    style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    currentUserController.userVM.value?.deliveryAddressViewModel?.address ?? '',
                                    style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(color: Colors.white, thickness: 2),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Personal:', style: AppTextsStyle.bold(size: 14, color: Colors.white)),
                                  Text(
                                    '${currentUserController.userVM.value?.dialCode ?? ''} ${currentUserController.userVM.value?.number ?? ''} ',
                                    style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                  ),
                                  Expanded(
                                    child: Text(
                                      currentUserController.userVM.value?.email ?? '',
                                      style: AppTextsStyle.medium.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      OpenContainerAnimation(
                        closedBuilder: (context, openContainer) {
                          return ListTile(
                            leading: const Icon(Icons.person, color: Colors.black),
                            title: Text('My Profile', style: AppTextsStyle.bold()),
                            onTap: openContainer,
                          );
                        },
                        openBuilder: (context, closeContainer) => ProfilePage(),
                      ),
                      LanguageDropdown(),

                      ListTile(
                        leading: const Icon(Icons.exit_to_app_rounded, color: Colors.black),
                        title: Text('Log out', style: AppTextsStyle.bold()),
                        onTap: () {
                          AppRouter.openGreetingPage();
                          currentUserController.clearUserData();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
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
            ],
          ),
        ),
      ),
    );
  }
}
