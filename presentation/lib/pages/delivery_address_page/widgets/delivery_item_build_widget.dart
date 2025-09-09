import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

class DeliveryItemBuildWidget extends StatefulWidget {
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
  State<DeliveryItemBuildWidget> createState() => _DeliveryItemBuildWidgetState();
}

class _DeliveryItemBuildWidgetState extends State<DeliveryItemBuildWidget> {
  @override
  Widget build(BuildContext context) {
    final Widget child;
    final String keyValue;

    if (widget.item is DeliveryTypeViewModel) {
      final viewModel = widget.item as DeliveryTypeViewModel;
      child = DeliveryTypeWidget(itemViewModel: viewModel, onCallBack: widget.onCallBack);
      keyValue = 'delivery_type';
    } else if (widget.item is SelectionViewModel) {
      final viewModel = widget.item as SelectionViewModel;

      child = SelectionWidget(
        itemViewModel: viewModel,
        onSelectionChanged: (value) {
          if (viewModel.keyId == 'country') {
            final country = deliveryAddressController.countries.firstWhere((c) => c.name == value);
            deliveryAddressController.selectedCountry.value = country;
            deliveryAddressController.selectedState.value = null;
            deliveryAddressController.selectedCity.value = null;
            deliveryAddressController.states.clear();
            deliveryAddressController.cities.clear();
            deliveryAddressController.loadStates(country);
          } else if (viewModel.keyId == 'region') {
            final state = deliveryAddressController.states.firstWhere((s) => s.name == value);
            deliveryAddressController.selectedState.value = state;
            deliveryAddressController.selectedCity.value = null;
            deliveryAddressController.cities.clear();
            if (deliveryAddressController.selectedCountry.value != null) {
              deliveryAddressController.loadCities(deliveryAddressController.selectedCountry.value!, state);
            }
          } else if (viewModel.keyId == 'city') {
            deliveryAddressController.selectedCity.value = deliveryAddressController.cities.firstWhere(
              (c) => c.name == value,
            );
          }
        },
      );
      keyValue = 'selection_${viewModel.keyId}_${viewModel.title}';
    } else if (widget.item is TextFieldViewModel) {
      final viewModel = widget.item as TextFieldViewModel;
      child = TextFieldWidget(itemViewModel: viewModel);
      keyValue = 'text_field_${viewModel.keyId}';
    } else {
      child = const SizedBox.shrink();
      keyValue = 'unknown_${widget.index}';
    }

    if (widget.item is DeliveryTypeViewModel) {
      return child;
    }

    if (widget.isRemoval) {
      return FadeTransition(
        opacity: widget.animation,
        child: child.animate().fadeOut(duration: 200.ms),
      );
    }

    return SizeFadeTransition(
      animation: widget.animation,
      child: KeyedSubtree(
        key: ValueKey(keyValue),
        child: child
            .animate()
            .fadeIn(duration: 500.ms, delay: (150 * widget.index).ms)
            .slideY(begin: 0.8, end: 0.0, duration: 500.ms, delay: (100 * widget.index).ms, curve: Curves.easeInOut)
            .scaleXY(begin: 0.7, end: 1, duration: 400.ms, delay: (100 * widget.index).ms, curve: Curves.easeInOut),
      ),
    );
  }
}
