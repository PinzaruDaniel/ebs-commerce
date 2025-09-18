import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/animated_list_items_build_widget.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import '../../util/widgets/text_field_widget.dart';
import '../../view/base_view_model.dart';

class ContactInformationPage extends StatefulWidget {
  const ContactInformationPage({super.key, required this.onSave});

  final Function onSave;
  @override
  State<ContactInformationPage> createState() => _ContactInformationPageState();
}

class _ContactInformationPageState extends State<ContactInformationPage> {
  ContactInformationController get contactInformationController=>Get.find();
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  final items = contactInformationController.allItems.toList();

                  return ImplicitlyAnimatedList<BaseViewModel>(
                    items: items,
                    padding: const EdgeInsets.only(bottom: 10),
                    areItemsTheSame: (a, b) => a.hashCode == b.hashCode,
                    itemBuilder: (context, animation, item, index) {
                      if (item is! TextFieldViewModel) {
                        return const SizedBox.shrink();
                      }

                      return AnimatedListItemWrapper(
                        animation: animation,
                        index: index,
                        keyValue: 'text_field_${item.keyId}',
                        child: TextFieldWidget(itemViewModel: item),
                      );
                    },
                  );

                }),

              ),
            ],
          ),
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
