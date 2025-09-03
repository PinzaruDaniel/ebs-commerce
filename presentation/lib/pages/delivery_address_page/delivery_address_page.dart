import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
                Widget widget;
                String keyValue = '${deliveryAddressController.deliveryTypeVM.value.selected}_$index';
                if (item is DeliveryTypeViewModel) {
                  widget = DeliveryTypeWidget(itemViewModel: item);
                  keyValue = 'delivery_type_${item.selected}_$index';
                } else if (item is SelectionViewModel) {
                  widget = SelectionWidget(itemViewModel: item);
                  keyValue =
                      'selection_${item.title}_${deliveryAddressController.deliveryTypeVM.value.selected}_$index';
                } else if (item is TextFieldViewModel) {
                  widget = TextFieldWidget(itemViewModel: item);
                  keyValue =
                      'text_field_${item.title}_${deliveryAddressController.deliveryTypeVM.value.selected}_$index';
                } else {
                  widget = const SizedBox.shrink();
                }
                return KeyedSubtree(
                  key: ValueKey(keyValue),
                  child: item is DeliveryTypeViewModel
                      ? widget
                      : widget
                            .animate()
                            .fadeIn(duration: 600.ms, delay: (100  * index).ms)
                            .slideY(
                              begin: 0.8,
                              end: 0.0,
                              duration: 600.ms,
                              delay: (100 * index).ms,
                              curve: Curves.easeInOut,
                            )
                            .scaleXY(
                              begin: 0.7,
                              end: 1,
                              duration: 600.ms,
                              delay: (150 * index).ms,
                              curve: Curves.easeInOut,
                            ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        title:  AppTexts.save,
        showIcon: false,
        onTap: () {
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
