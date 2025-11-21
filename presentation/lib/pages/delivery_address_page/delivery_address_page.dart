import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_controller.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_item_build_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/base/base_page.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/loading_overlay_widget.dart';
import 'package:presentation/util/widgets/selection_widget.dart';
import 'package:presentation/view/delivery_address_view_model.dart';

import '../../util/widgets/text_field_widget.dart';
import '../../view/base_view_model.dart';

class DeliveryAddressPage extends StatefulWidget {
  final Function onSave;
  final DeliveryAddressViewModel? deliveryAddressVM;

  const DeliveryAddressPage({super.key, required this.onSave, required this.deliveryAddressVM});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final _formKey = GlobalKey<FormState>();

  DeliveryAddressController get deliveryAddressController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(DeliveryAddressController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      deliveryAddressController.initItems(widget.deliveryAddressVM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: [PendingIds.getCountries],
      appBar: AppBarWidget(
        title: AppTexts.deliveryAddress.capitalizeFirst,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      builder: (context) {
        return Form(
          key: _formKey,
          child: ImplicitlyAnimatedList<BaseViewModel>(
            items: deliveryAddressController.allItems.toList(),
            padding: const EdgeInsets.only(bottom: 10),
            shrinkWrap: true,
            areItemsTheSame: (a, b) {
              if (a.runtimeType != b.runtimeType) return false;
              if (a is SelectionViewModel && b is SelectionViewModel) {
                return a.keyId == b.keyId;
              }
              if (a is TextFieldViewModel && b is TextFieldViewModel) {
                return a.keyId == b.keyId;
              }
              if (a is DeliveryTypeViewModel && b is DeliveryTypeViewModel) {
                return a.selected == b.selected;
              }
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
              void onSelect(OptionViewModel selected) {
                if (item is! SelectionViewModel) return;
                final viewModel = item;
                if (viewModel.keyId == 'country') {
                  final country = deliveryAddressController.countries.firstWhere((c) => c.name == selected.titleKey);
                  deliveryAddressController.selectedCountry.value = country;
                  deliveryAddressController.selectedState.value = null;
                  deliveryAddressController.selectedCity.value = null;
                  deliveryAddressController.states.clear();
                  deliveryAddressController.cities.clear();
                  deliveryAddressController.loadStates(country);
                } else if (viewModel.keyId == 'region') {
                  final state = deliveryAddressController.states.firstWhere((s) => s.name == selected.titleKey);
                  deliveryAddressController.selectedState.value = state;
                  deliveryAddressController.selectedCity.value = null;
                  deliveryAddressController.cities.clear();
                  deliveryAddressController.loadCities(deliveryAddressController.selectedCountry.value!, state);
                } else if (viewModel.keyId == 'city') {
                  deliveryAddressController.selectedCity.value = deliveryAddressController.cities.firstWhere(
                    (c) => c.name == selected.titleKey,
                  );
                }
              }

              return DeliveryItemBuildWidget(
                onCallBack: () async {
                  await deliveryAddressController.removeAllItemsAnimated();
                  deliveryAddressController.updateAllItems();
                },
                onSelect: onSelect,
                item: item,
                animation: animation,
                index: index,
              );
            },
          ),
        );
      },
      bottomNavigationBar: BottomNavigationBarWidget(
        title: AppTexts.save,
        showIcon: false,
        onTap: () {
          if (_formKey.currentState?.validate() ?? false) {
            widget.onSave.call(deliveryAddressController.toDeliveryAddressViewModel());
            Get.back();
          }
        },
      ),
    );
  }
}
