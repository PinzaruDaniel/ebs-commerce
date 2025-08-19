import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/modules/delivery_address/use_cases/cities/get_cities_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/countries/get_countries_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/states/get_states_use_case.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/dropdown_widget.dart';
import 'package:presentation/util/mapper/cities_response_entity_mapper.dart';
import 'package:presentation/util/mapper/countries_entity_mapper.dart';
import 'package:presentation/util/mapper/states_entity_mapper.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/country_view_model.dart';
import 'package:presentation/view/state_view_model.dart';
import 'package:presentation/view/city_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';

import '../../util/widgets/failure_snack_bar_widget.dart';

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

  final GetCountriesUseCase getCountriesUseCase = GetIt.instance<GetCountriesUseCase>();
  final GetStatesUseCase getStatesUseCase = GetIt.instance<GetStatesUseCase>();
  final GetCitiesUseCase getCitiesUseCase = GetIt.instance<GetCitiesUseCase>();

  Timer? _debounce;

  final RxList<BaseViewModel> allItems = RxList([]);

  final deliveryTypeVM = DeliveryTypeViewModel(
    options: DeliveryType.values.map((e) => e.label).toList(),
    initial: DeliveryType.pickup.label,
  ).obs;
  final Rxn<DeliveryAddressViewModel> addressVM = Rxn<DeliveryAddressViewModel>();

  RxList<CountryViewModel> countries = RxList([]);
  RxList<StateViewModel> states = RxList([]);
  RxList<CityViewModel> cities = RxList([]);

  Rxn<CountryViewModel> selectedCountry = Rxn<CountryViewModel>();
  Rxn<StateViewModel> selectedState = Rxn<StateViewModel>();
  Rxn<CityViewModel> selectedCity = Rxn<CityViewModel>();

  RxBool isLoading = false.obs;

  List<String> pickupLocations = ['Posta moldovei, Armeneasca 2', 'undeva departe'];

  @override
  void onInit() {
    super.onInit();

    if (countries.isEmpty) {
      deliveryTypeVM.value = DeliveryTypeViewModel(
        options: DeliveryType.values.map((e) => e.label).toList(),
        initial: DeliveryType.pickup.label,
      );

      deliveryTypeVM.value.selected.listen((_) {
        updateAllItems();
        final selectedType = DeliveryTypeExtension.fromLabel(deliveryTypeVM.value.selected.value);
        if (selectedType != DeliveryType.pickup) {
          if (countries.isEmpty) {
            loadCountries();
          } else {
            updateAllItems();
          }
        }
      });
      updateAllItems();
      if (countries.isEmpty) loadCountries();
    } else if (selectedCountry.value != null && (states.isEmpty || cities.isEmpty)) {
      loadStates(selectedCountry.value!);
    }
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  Future<void> loadCountries() async {
    isLoading.value = true;
    final result = await getCountriesUseCase();
    result.fold(
      (failure) {
        isLoading.value = false;
        showFailureSnackBar(failure);
      },
      (list) {
        countries.value = list.map((c) => c.toViewModel).toList();
      },
    );
    isLoading.value = false;
    if (selectedCountry.value == null && countries.isNotEmpty) {
      selectedCountry.value = countries.first;
      selectedState.value = null;
      selectedCity.value = null;
      states.clear();
      cities.clear();
      loadStates(selectedCountry.value!);
    }
  }

  Future<void> loadStates(CountryViewModel country) async {
    if (country.name.isEmpty) return;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      isLoading.value = true;
      states.clear();
      final params = GetStatesUseCaseParams(country: country.iso2);
      final result = await getStatesUseCase(params);

      result.fold(
        (failure) {
          isLoading.value = false;
          showFailureSnackBar(failure);
        },
        (list) {
          states.value = list.map((e) => e.toViewModel).toList();
        },
      );

      isLoading.value = false;
      selectedState.value = states.isNotEmpty ? states.first : null;
      selectedCity.value = null;
      cities.clear();
      if (selectedState.value != null) {
        loadCities(country, selectedState.value!);
      }
      updateAllItems();
    });
  }

  Future<void> loadCities(CountryViewModel country, StateViewModel state) async {
    if (country.name.isEmpty || state.code.isEmpty) return;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      isLoading.value = true;
      cities.clear();

      final params = GetCitiesUseCaseParams(country: country.name, state: state.name);
      final result = await getCitiesUseCase(params);

      result.fold(
        (failure) {
          isLoading.value = false;
          showFailureSnackBar(failure);
        },
        (entity) {
          cities.value = entity.toViewModelList;
        },
      );

      isLoading.value = false;
      selectedCity.value = cities.isNotEmpty ? cities.first : null;
      updateAllItems();
    });
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
      SelectionViewModel(
        title: 'Country',
        options: countries.map((c) => c.name).toList(),
        initialValue: selectedCountry.value?.name ?? (countries.isNotEmpty ? countries.first.name : ''),
        onSelectionChanged: (value) {
          selectedCountry.value = countries.firstWhere((c) => c.name == value);
          selectedState.value = null;
          selectedCity.value = null;
          states.clear();
          cities.clear();
          loadStates(selectedCountry.value!);
        },
      ),
      SelectionViewModel(
        title: 'Region',
        options: states.map((s) => s.name).toList(),
        initialValue: selectedState.value?.name ?? (states.isNotEmpty ? states.first.name : ''),
        onSelectionChanged: (value) {
          selectedState.value = states.firstWhere((s) => s.name == value);
          selectedCity.value = null;
          cities.clear();
          if (selectedCountry.value != null) {
            loadCities(selectedCountry.value!, selectedState.value!);
          }
        },
      ),
      SelectionViewModel(
        title: 'City',
        options: cities.map((c) => c.name).toList(),
        initialValue: selectedCity.value?.name ?? (cities.isNotEmpty ? cities.first.name : ''),
        onSelectionChanged: (value) {
          selectedCity.value = cities.firstWhere((c) => c.name == value);
        },
      ),
      TextFieldViewModel(title: 'Postal code', initialValue: '', textInputType: TextInputType.number),
      TextFieldViewModel(title: 'Address', initialValue: ''),
      TextFieldViewModel(title: 'Other Comments', initialValue: ''),
    ]);
  }

  DeliveryAddressViewModel toDeliveryAddressViewModel() {
    final type = DeliveryTypeExtension.fromLabel(deliveryTypeVM.value.selected.value);

    if (type == DeliveryType.pickup) {
      final pickupLocation = getViewModel<SelectionViewModel>('Sediu').selectedValue.value;
      final model = DeliveryAddressViewModel(deliveryType: type.label, pickupLocation: pickupLocation);
      addressVM.value = model;
      return model;
    } else {
      final model = DeliveryAddressViewModel(
        deliveryType: type.label,
        country: getViewModel<SelectionViewModel>('Country').selectedValue.value,
        region: getViewModel<SelectionViewModel>('Region').selectedValue.value,
        city: getViewModel<SelectionViewModel>('City').selectedValue.value,
        postalCode: getViewModel<TextFieldViewModel>('Postal code').value.value,
        address: getViewModel<TextFieldViewModel>('Address').value.value,
        comments: getViewModel<TextFieldViewModel>('Other Comments').value.value,
      );
      addressVM.value = model;
      return model;
    }
  }

  T getViewModel<T extends BaseViewModel>(String title) {
    return allItems.firstWhere((item) => item is T && (item as dynamic).title == title) as T;
  }
}
