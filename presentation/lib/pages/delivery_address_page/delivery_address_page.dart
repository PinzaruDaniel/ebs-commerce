import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_controller.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_item_build_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import '../../util/widgets/text_field_widget.dart';
import '../../view/base_view_model.dart';

class DeliveryAddressPage extends StatefulWidget {
  final Function onSave;

  const DeliveryAddressPage({super.key, required this.onSave});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final _formKey = GlobalKey<FormState>();
  late DeliveryAddressController deliveryAddressController;

  @override
  void initState() {
    super.initState();
    deliveryAddressController = Get.put(DeliveryAddressController());

    // Initialize the items after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      deliveryAddressController.initItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                if (a is DeliveryTypeViewModel && b is DeliveryTypeViewModel) return true;
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
            deliveryAddressController.onInit();
            widget.onSave.call(
              deliveryAddressController.toDeliveryAddressViewModel(),
            );
            Get.back();
          }
        },
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.noProductsToShow,
      ),
    );
  }
}