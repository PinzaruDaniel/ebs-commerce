import 'package:animations/animations.dart';
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
import '../../../util/widgets/open_container_animation_widget.dart'; // <-- import here

class UserMenuWidget extends StatelessWidget {
  const UserMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: Get.width * 0.7,
          color: Colors.white,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    currentUserController.userVM.value?.imageUrl ??
                        'https://cdn-icons-png.flaticon.com/512/6522/6522516.png',
                  ),
                ),
                accountName: Text(currentUserController.userVM.value?.name ?? 'User'),
                accountEmail: Text(currentUserController.userVM.value?.email ?? ''),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  children: [
                    OpenContainerAnimation(
                      closedBuilder: (context, openContainer) {
                        return ListTile(
                          leading: const Icon(Icons.person, color: Colors.black),
                          title: const Text(
                            'My Profile',
                            style: AppTextsStyle.medium,
                          ),
                          onTap: openContainer,
                        );
                      },
                      openBuilder: (context, closeContainer) => ProfilePage(),
                    ),
                    LanguageDropdown(),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app_rounded, color: Colors.black),
                      title: const Text(
                        'Log out',
                        style: AppTextsStyle.medium,
                      ),
                      onTap: () {
                        AppRouter.openGreetingPage();
                        currentUserController.clearUserData();
                      },
                    ),
                  ],
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
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}