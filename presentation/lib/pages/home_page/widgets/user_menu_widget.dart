import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/widgets/language_dropdown_widget.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../../controllers/controller_imports.dart';
import '../../../localization/localization_loader.dart';
import '../../../util/resources/app_colors.dart';
import '../../../util/resources/app_text_styles.dart';
import '../../../util/resources/app_texts.dart';
import '../../../util/routing/app_router.dart';
import '../../../util/widgets/base/base_button_widget.dart';

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
                decoration: BoxDecoration(color: AppColors.primary),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home, color: Colors.black),
                      title: const Text('Home', style: AppTextsStyle.medium,),
                      onTap: () {
                        debugPrint('Home tapped');
                      },
                    ),
                    LanguageDropdown(),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app_rounded, color: Colors.black),
                      title: const Text('Log out',  style: AppTextsStyle.medium,),
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
                  buttonColor: AppColors.primary ,
                  textColor: Colors.white ,
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
