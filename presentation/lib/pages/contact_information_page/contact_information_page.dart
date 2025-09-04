import 'package:flutter/material.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../util/widgets/text_field_widget.dart';

class ContactInformationPage extends StatefulWidget {
  const ContactInformationPage({super.key});

  @override
  State<ContactInformationPage> createState() => _ContactInformationPageState();
}

class _ContactInformationPageState extends State<ContactInformationPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
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
            Form(
                key: _formKey,
                child: Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: contactInformationController.allItems.length,
                    itemBuilder: (context, index) {
                      var item = contactInformationController.allItems[index];
                      if (item is TextFieldViewModel) {
                        return TextFieldWidget(itemViewModel: item);
                      }
                      return null;
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        title: AppTexts.save,
        showIcon: false,
        onTap: ()  {
          if (_formKey.currentState?.validate() ?? false) {
            checkoutController.initAllItems();
            contactInformationController.initAllItems();
            Navigator.pop(context);
          }
        },
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.noProductsToShow,
      ),
    );
  }
}
