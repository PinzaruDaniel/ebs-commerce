import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';
import 'package:presentation/pages/contact_information_page/widgets/phone_number_widget.dart';
import 'package:presentation/util/widgets/loading_overlay_widget.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../util/widgets/text_field_widget.dart';

class ContactInformationPage extends StatefulWidget {
  const ContactInformationPage({super.key, required this.onSave});

  final Function onSave;

  @override
  State<ContactInformationPage> createState() => _ContactInformationPageState();
}

class _ContactInformationPageState extends State<ContactInformationPage> {
  ContactInformationController get contactInformationController => Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Get.put(ContactInformationController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      contactInformationController.initAllItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppTexts.contactInfo,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Obx(() {
                      final items = contactInformationController.allItems.toList();

                      return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 10),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          if (item is TextFieldViewModel) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldWidget(itemViewModel: item),
                            );
                          } else if (item is PhoneNumberViewModel) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PhoneNumberWidget(itemViewModel: item),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),

            /*Obx(() {
              return contactInformationController.isLoading.value
                  ? LoadingOverlayWidget(isLoading: false)
                  : const SizedBox.shrink();
            }),*/
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        title: AppTexts.save,
        showIcon: false,
        onTap: () {
          if (_formKey.currentState?.validate() ?? false) {
            widget.onSave.call(contactInformationController.toUserViewModel());
            Get.back();
          }
        },
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.noProductsToShow,
      ),
    );
  }

}
