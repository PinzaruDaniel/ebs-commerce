// lib/pages/delivery_address_page/delivery_address_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_controller.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/dropdown_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/text_field_widget.dart';

import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../view/product_view_model.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({super.key});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  DeliveryAddressController get deliveryController => Get.find();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Delivery Address',
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: deliveryController.allItems.length,
                  itemBuilder: (context, index) {
                    var item = deliveryController.allItems[index];
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        item: dummyProduct,
        title: 'Save',
        showIcon: false,
        router: () {
          final address = deliveryController.toDeliveryAddressViewModel();
          print(address.deliveryType);
          Navigator.pop(context);
        },
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.noProductsToShow,
      ),
    );
  }
}