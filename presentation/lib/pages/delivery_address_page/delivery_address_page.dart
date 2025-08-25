import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({super.key});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarWidget(
        title: AppTexts.deliveryAddress.capitalizeFirst,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      body: SafeArea(
        child: Obx(
              () => Form(
            key: _formKey,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 10),
              itemCount: deliveryAddressController.allItems.length,
              itemBuilder: (context, index) {
                var item = deliveryAddressController.allItems[index];
                if (item is DeliveryTypeViewModel) {
                  return DeliveryTypeWidget(itemViewModel: item);
                } else if (item is SelectionViewModel) {
                  return SelectionWidget(itemViewModel: item);
                } else if (item is TextFieldViewModel) {
                  return TextFieldWidget(itemViewModel: item);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        title: deliveryAddressController.isLoading.value ? AppTexts.loading : AppTexts.save,
        showIcon: false,
        onTap: ()  {
          if (_formKey.currentState?.validate() ?? false) {
            checkoutController.initAllItems();
            deliveryAddressController.onInit();
            Navigator.pop(context);
          }
        },
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.noProductsToShow,
      ),
    );
  }
}
