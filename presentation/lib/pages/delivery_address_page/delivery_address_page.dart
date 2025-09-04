import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
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
            child: ImplicitlyAnimatedReorderableList(
              padding: const EdgeInsets.only(bottom: 10),
              items: deliveryAddressController.allItems.toList(),
              areItemsTheSame: (oldItem, newItem) => oldItem.hashCode == newItem.hashCode,
              onReorderFinished: (item, from, to, newItems) {

                setState(() {
                  deliveryAddressController.allItems.toList()..clear()..addAll(newItems);
                });
              },
              itemBuilder: (context, itemAnimation, item, index) {
                Widget widget;
                String keyValue;

                if (item is DeliveryTypeViewModel) {
                  widget = DeliveryTypeWidget(itemViewModel: item);
                  keyValue = 'delivery_type';
                } else if (item is SelectionViewModel) {
                  widget = SelectionWidget(itemViewModel: item);
                  keyValue = 'selection_${item.keyId}';
                } else if (item is TextFieldViewModel) {
                  widget = TextFieldWidget(itemViewModel: item);
                  keyValue = 'text_field_${item.keyId}';
                } else {
                  widget = const SizedBox.shrink();
                  keyValue = 'unknown_$index';
                }

                return Reorderable(
                  key: ValueKey(keyValue),
                  builder: (context, dragAnimation, inDrag) {
                    return SizeFadeTransition(
                      sizeFraction: 0.7,
                      curve: Curves.easeInOut,
                      animation: itemAnimation,
                      child: item is DeliveryTypeViewModel
                          ? widget
                          : widget,
                    );
                  },
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
            deliveryAddressController.initItems();
            Navigator.pop(context);
          }
        },
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.noProductsToShow,
      ),

    );
  }
}