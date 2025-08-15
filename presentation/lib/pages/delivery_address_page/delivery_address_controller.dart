import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/dropdown_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';

enum DeliveryType { pickup, fanCourier, dhl }

extension DeliveryTypeExtension on DeliveryType {
  String get label {
    switch (this) {
      case DeliveryType.pickup:
        return 'Ridicare la sediu';
      case DeliveryType.fanCourier:
        return 'Fan courier';
      case DeliveryType.dhl:
        return 'DHL';
    }
  }

  static DeliveryType fromLabel(String label) {
    return DeliveryType.values.firstWhere((e) => e.label == label);
  }
}

class DeliveryAddressController extends GetxController {

  final RxList<BaseViewModel> allItems = RxList([]);

  final deliveryTypeVM = DeliveryTypeViewModel(
    options: DeliveryType.values.map((e) => e.label).toList(),
    initial: DeliveryType.pickup.label,
  ).obs;

  final Rxn<DeliveryAddressViewModel> addressVM = Rxn<DeliveryAddressViewModel>();

  static const List<String> pickupLocations = ['Posta moldovei, Armeneasca 2', 'undeva departe'];
  static const List<String> countries = ['South Africa'];
  static const List<String> regions = ['Kroonstad', 'Chisinau', 'Soroca'];
  static const List<String> cities = ['Kroonstad'];

  @override
  void onInit() {
    super.onInit();

    deliveryTypeVM.value = DeliveryTypeViewModel(
      options: DeliveryType.values.map((e) => e.label).toList(),
      initial: DeliveryType.pickup.label,
    );

    deliveryTypeVM.value.selected.listen((_) => updateAllItems());

    updateAllItems();
  }

  void updateAllItems() {
    allItems.clear();
    allItems.add(deliveryTypeVM.value);

    final selectedType = DeliveryTypeExtension.fromLabel(deliveryTypeVM.value.selected.value);

    if (selectedType == DeliveryType.pickup) {
      _addPickupFields();
    } else {
      _addDeliveryFields();
    }

    allItems.refresh();
  }

  void _addPickupFields() {
    allItems.add(SelectionViewModel(title: 'Sediu', options: pickupLocations, initialValue: pickupLocations.first));
  }

  void _addDeliveryFields() {
    allItems.addAll([
      _createDropdown('Country', countries),
      _createDropdown('Region', regions),
      _createDropdown('City', cities),
      _createTextField('Postal code', '123456', TextInputType.number),
      _createTextField('Address', '1387 Akasia St'),
      _createTextField('Other Comments', 'Linga un salam'),
    ]);
  }

  SelectionViewModel _createDropdown(String title, List<String> options) {
    return SelectionViewModel(title: title, options: options, initialValue: options.first);
  }

  TextFieldViewModel _createTextField(String title, String initialValue, [TextInputType? type]) {
    return TextFieldViewModel(title: title, initialValue: initialValue, textInputType: type);
  }

  T _getViewModel<T extends BaseViewModel>(String title) {
    return allItems.firstWhere((item) => item is T && (item as dynamic).title == title) as T;
  }

  DeliveryAddressViewModel toDeliveryAddressViewModel() {
    final type = DeliveryTypeExtension.fromLabel(deliveryTypeVM.value.selected.value);

    if (type == DeliveryType.pickup) {
      final pickupLocation = _getViewModel<SelectionViewModel>('Sediu').selectedValue.value;
      final model = DeliveryAddressViewModel(deliveryType: type.label, pickupLocation: pickupLocation);
      addressVM.value = model;
      return model;
    } else {
      final model = DeliveryAddressViewModel(
        deliveryType: type.label,
        country: _getViewModel<SelectionViewModel>('Country').selectedValue.value,
        region: _getViewModel<SelectionViewModel>('Region').selectedValue.value,
        city: _getViewModel<SelectionViewModel>('City').selectedValue.value,
        postalCode: _getViewModel<TextFieldViewModel>('Postal code').value.value,
        address: _getViewModel<TextFieldViewModel>('Address').value.value,
        comments: _getViewModel<TextFieldViewModel>('Other Comments').value.value,
      );
      addressVM.value = model;
      return model;
    }
  }
}
