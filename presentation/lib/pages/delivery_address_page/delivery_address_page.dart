import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_item_build_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../view/base_view_model.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      deliveryAddressController.initItems();
    });
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
        child: Obx(() {
          final items = deliveryAddressController.allItems.toList();

          return Form(
            key: _formKey,
            child: ImplicitlyAnimatedList<BaseViewModel>(
              items: items,
              padding: const EdgeInsets.only(bottom: 10),
              shrinkWrap: true,
              areItemsTheSame: (a, b) {
                if (a.runtimeType != b.runtimeType) return false;

                if (a is SelectionViewModel && b is SelectionViewModel) return a.keyId == b.keyId;
                if (a is TextFieldViewModel && b is TextFieldViewModel) return a.keyId == b.keyId;
                if (a is DeliveryTypeViewModel && b is DeliveryTypeViewModel) return a.selected == b.selected;

                return false;
              },

              removeItemBuilder: (context, animation, oldItem) {
                return DeliveryItemBuildWidget(
                  onCallBack: () async {
                    await deliveryAddressController.removeAllItemsAnimated();
                    deliveryAddressController.updateAllItems();
                  },
                  item: oldItem,
                  animation: animation,
                  index: 0,
                  isRemoval: true,
                );
              },

              itemBuilder: (context, animation, item, index) {
                return DeliveryItemBuildWidget(
                  onCallBack: () async {
                    await deliveryAddressController.removeAllItemsAnimated();
                    deliveryAddressController.updateAllItems();
                  },
                  item: item,
                  animation: animation,
                  index: index,
                );
              },
            ),
          );
        }),
      ),

      bottomNavigationBar: BottomNavigationBarWidget(
        title: AppTexts.save,
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
