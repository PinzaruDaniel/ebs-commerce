import 'package:common/constants/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:presentation/pages/authentification_page/authentification_controller.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';

import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';

class AuthentificationPage extends StatefulWidget {
  const AuthentificationPage({super.key});

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  final AuthentificationController authController = Get.put(AuthentificationController());
  final _formKey = GlobalKey<FormState>();

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
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Center(child: AppIcons.companyIcon(width: 200)),
              ),
              Center(child: Text('Login', style: AppTextsStyle.bold(size: 30))),

              Flexible(
                child: Obx(() {
                  final items = authController.allItems.toList();
                  return ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      if (item is TextFieldViewModel) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldWidget(itemViewModel: item),
                        );
                      }
                      return null;
                    },
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.primary),
                    child: Center(
                      child: Text('Login', style: AppTextsStyle.bold(size: 20, color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
