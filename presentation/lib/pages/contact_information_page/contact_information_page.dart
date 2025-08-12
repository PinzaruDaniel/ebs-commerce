import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';
import 'package:presentation/pages/contact_information_page/widgets/text_field_contact_info_widget.dart';

import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';

class ContactInformationPage extends StatefulWidget {
  const ContactInformationPage({super.key});

  @override
  State<ContactInformationPage> createState() => _ContactInformationPageState();
}

class _ContactInformationPageState extends State<ContactInformationPage> {
  ContactInformationController get contactController => Get.find();

  @override
  void initState(){
    super.initState();
    Get.put(ContactInformationController());

    contactController.initAllItems();

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
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: contactController.allItems.length,
                  itemBuilder: (context, index) {
                    var item = contactController.allItems[index];
                    if (item is TextFieldContactInfoViewModel) {
                      return TextFieldContactInfoWidget(itemViewModel: item,);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
