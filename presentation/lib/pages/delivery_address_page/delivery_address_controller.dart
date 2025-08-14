import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/dropdown_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';

class DeliveryAddressController extends GetxController {
  RxList<BaseViewModel> allItems = RxList([]);
  final List<String> deliveryTypes = ['Ridicare la sediu', 'Fan courier', 'DHL'];
  late DeliveryTypeViewModel deliveryTypeVM;
  Rxn<DeliveryAddressViewModel> addressVM = Rxn<DeliveryAddressViewModel>();

  @override
  void onInit() {
    super.onInit();
    deliveryTypeVM = DeliveryTypeViewModel(options: deliveryTypes, initial: deliveryTypes.first);
    initAllItems();
  }

  void initAllItems() {
    updateAllItems();
  }

  void updateAllItems() {
    allItems.clear();
    allItems.add(deliveryTypeVM);

    final selectedType = deliveryTypeVM.selected.value;

    if (selectedType == 'Ridicare la sediu') {
      allItems.add(
        SelectionViewModel(
          title: 'Sediu',
          options: ['Posta moldovei, Armeneasca 2'],
          initialValue: 'Posta moldovei, Armeneasca 2',
        ),
      );
    } else {
      allItems.add(
        SelectionViewModel(
          title: 'Country',
          options: ['South Africa'],
          initialValue: 'South Africa',
        ),
      );
      allItems.add(
        SelectionViewModel(
          title: 'Region',
          options: ['Kroonstad', 'Kroonstad', 'Kroonstad', 'Kroonstad'],
          initialValue: 'Kroonstad',
        ),
      );
      allItems.add(
        SelectionViewModel(
          title: 'City',
          options: ['Kroonstad'],
          initialValue: 'Kroonstad',
        ),
      );
      allItems.add(
        TextFieldViewModel(
          title: 'Postal code',
          initialValue: '123456',
          textInputType: TextInputType.number,
        ),
      );
      allItems.add(
        TextFieldViewModel(
          title: 'Address',
          initialValue: '1387 Akasia St',
        ),
      );
      allItems.add(
        TextFieldViewModel(
          title: 'Other Comments',
          initialValue: 'Linga un salam',
        ),
      );
    }
    allItems.refresh();
  }

  DeliveryAddressViewModel toDeliveryAddressViewModel() {
    final type = deliveryTypeVM.selected.value;

    if (type == 'Ridicare la sediu') {
      final sediu = (allItems[1] as SelectionViewModel).selectedValue.value;
      final model = DeliveryAddressViewModel(deliveryType: type, pickupLocation: sediu);
      addressVM.value = model;
      return model;
    } else {
      final country = (allItems[1] as SelectionViewModel).selectedValue.value;
      final region = (allItems[2] as SelectionViewModel).selectedValue.value;
      final city = (allItems[3] as SelectionViewModel).selectedValue.value;
      final postalCode = (allItems[4] as TextFieldViewModel).value.value;
      final address = (allItems[5] as TextFieldViewModel).value.value;
      final comments = (allItems[6] as TextFieldViewModel).value.value;
      final model = DeliveryAddressViewModel(
        deliveryType: type,
        country: country,
        region: region,
        city: city,
        postalCode: postalCode,
        address: address,
        comments: comments,
      );
      addressVM.value = model;
      return model;
    }
  }
}