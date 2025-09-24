import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/delivery_address_page/delivery_address_controller.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/animated_list_items_build_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

class DeliveryItemBuildWidget extends StatelessWidget {
  final BaseViewModel item;
  final Animation<double> animation;
  final int index;
  final bool isRemoval;
  final Function onCallBack;

  const DeliveryItemBuildWidget({
    super.key,
    required this.item,
    required this.animation,
    required this.index,
    this.isRemoval = false,
    required this.onCallBack,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final String keyValue;

    if (item is DeliveryTypeViewModel) {
      final viewModel = item as DeliveryTypeViewModel;
      child = DeliveryTypeWidget(itemViewModel: viewModel, onCallBack: onCallBack);
      keyValue = 'delivery_type';
    } else if (item is SelectionViewModel) {
      final viewModel = item as SelectionViewModel;
      child = SelectionWidget(
        itemViewModel: viewModel,
        onSelectionChanged: (value) {
          final controller = Get.find<DeliveryAddressController>();
          if (viewModel.keyId == 'country') {
            if (value == 'Select country') return;
            final country = controller.countries.firstWhere((c) => c.name == value);
            controller.selectedCountry.value = country;
            controller.selectedState.value = null;
            controller.selectedCity.value = null;
            controller.states.clear();
            controller.cities.clear();
            controller.loadStates(country);
          } else if (viewModel.keyId == 'region') {
            if (value == 'Select region') return;
            final state = Get.find<DeliveryAddressController>()
                .states
                .firstWhere((s) => s.name == value);
            Get.find<DeliveryAddressController>().selectedState.value = state;
            Get.find<DeliveryAddressController>().selectedCity.value = null;
            Get.find<DeliveryAddressController>().cities.clear();
            Get.find<DeliveryAddressController>()
                .loadCities(Get.find<DeliveryAddressController>().selectedCountry.value!, state);
          } else if (viewModel.keyId == 'city') {
            Get.find<DeliveryAddressController>().selectedCity.value =
                Get.find<DeliveryAddressController>()
                    .cities
                    .firstWhere((c) => c.name == value);
          }
        },
      );
      keyValue = 'selection_${viewModel.keyId}_${viewModel.title}';
    } else if (item is TextFieldViewModel) {
      final viewModel = item as TextFieldViewModel;
      child = TextFieldWidget(itemViewModel: viewModel);
      keyValue = 'text_field_${viewModel.keyId}';
    } else {
      child = const SizedBox.shrink();
      keyValue = 'unknown_$index';
    }

    final skipAnimation = animation.status == AnimationStatus.dismissed;

    if (item is DeliveryTypeViewModel || skipAnimation) {
      return KeyedSubtree(
        key: ValueKey(keyValue),
        child: child,
      );
    }

    return AnimatedListItemWrapper(
      animation: animation,
      index: index,
      isRemoval: isRemoval,
      child: child,
    );
  }
}
