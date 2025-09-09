import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/modules/delivery_address/use_cases/cities/get_cities_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/countries/get_countries_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/states/get_states_use_case.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/mapper/cities_response_entity_mapper.dart';
import 'package:presentation/util/mapper/countries_entity_mapper.dart';
import 'package:presentation/util/mapper/delivery_type_mapper.dart';
import 'package:presentation/util/mapper/states_entity_mapper.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/country_view_model.dart';
import 'package:presentation/view/state_view_model.dart';
import 'package:presentation/view/city_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import '../../util/enum/delivery_type.dart';
import '../../util/widgets/failure_snack_bar_widget.dart';

class DeliveryAddressController extends GetxController {
  final GetCountriesUseCase getCountriesUseCase = GetIt.instance<GetCountriesUseCase>();
  final GetStatesUseCase getStatesUseCase = GetIt.instance<GetStatesUseCase>();
  final GetCitiesUseCase getCitiesUseCase = GetIt.instance<GetCitiesUseCase>();

  RxList<BaseViewModel> allItems = RxList([]);

  Rx<DeliveryTypeViewModel> deliveryTypeVM = (DeliveryTypeViewModel(
    options: DeliveryType.values
        .map(
          (e) => DeliveryOptionViewModel(
            titleKey: e.label,
            icon: e.image,
            isSelected: e == DeliveryType.pickup,
            deliveryType: e,
          ),
        )
        .toList(),
  ).obs);

  final Rxn<DeliveryAddressViewModel> addressVM = Rxn<DeliveryAddressViewModel>();

  RxList<CountryViewModel> countries = RxList([]);
  RxList<StateViewModel> states = RxList([]);
  RxList<CityViewModel> cities = RxList([]);

  Rxn<CountryViewModel> selectedCountry = Rxn<CountryViewModel>();
  Rxn<StateViewModel> selectedState = Rxn<StateViewModel>();
  Rxn<CityViewModel> selectedCity = Rxn<CityViewModel>();

  RxBool isLoading = false.obs;

  List<String> pickupLocations = ['Posta moldovei, Armeneasca 2', 'undeva departe'];

  Future<void> initItems() async {
    updateAllItems();
    if (countries.isEmpty) {
      await loadCountries();
    }

    final selectedType = fromLabel(deliveryTypeVM.value.options.firstWhere((e) => e.isSelected == true).titleKey);
    if (selectedType != DeliveryType.pickup && countries.isEmpty) {
      await loadCountries();
    }

    if (selectedCountry.value != null && (states.isEmpty || cities.isEmpty)) {
      await loadStates(selectedCountry.value!);
    }
    toDeliveryAddressViewModel();
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
        isLoading.value = false;
        countries.value = list.map((c) => c.toViewModel).toList();

        if (selectedCountry.value == null && countries.isNotEmpty) {
          selectedCountry.value = countries.first;
          selectedState.value = null;
          selectedCity.value = null;
          states.clear();
          loadStates(selectedCountry.value!);
        }
      },
    );
  }

  Future<void> loadStates(CountryViewModel country) async {
    if (country.name.isEmpty) return;

    isLoading.value = true;

    final params = GetStatesUseCaseParams(country: country.iso2);
    final result = await getStatesUseCase(params);

    result.fold(
      (failure) {
        isLoading.value = false;
        showFailureSnackBar(failure);
      },
      (list) {
        states.value = list.map((e) => e.toViewModel).toList();

        isLoading.value = false;
        selectedState.value = states.isNotEmpty ? states.first : null;
        selectedCity.value = null;
        cities.clear();
      },
    );

    if (selectedState.value != null) {
      await loadCities(country, selectedState.value!);
    }
  }

  Future<void> loadCities(CountryViewModel country, StateViewModel state) async {
    print('muutle');
    if (country.name.isEmpty || state.code.isEmpty) return;

    isLoading.value = true;

    final params = GetCitiesUseCaseParams(country: country.name, state: state.name);
    final result = await getCitiesUseCase(params);

    result.fold(
      (failure) {
        isLoading.value = false;
        showFailureSnackBar(failure);
      },
      (entity) {
        cities.value = entity.toViewModelList;

        isLoading.value = false;
        selectedCity.value = cities.isNotEmpty ? cities.first : null;
      },
    );
    updateAllItems();
  }

  DeliveryType fromLabel(String label) {
    return DeliveryType.values.firstWhere((e) => e.label == label);
  }

  Future<void> updateAllItems({bool isAnimated=false}) async {
    final deliveryItem = deliveryTypeVM.value;

    allItems.value = [deliveryItem];
    allItems.refresh();

    if(isAnimated){
      await Future.delayed(Duration(milliseconds: 200));
    }

    final selectedType = fromLabel(deliveryItem.options.firstWhere((e) => e.isSelected).titleKey);

    if (selectedType == DeliveryType.pickup) {
      _addPickupFields();
    } else {
      _addDeliveryFields();
    }

    allItems.refresh();
  }

  void _addPickupFields() {
    allItems.add(
      SelectionViewModel(keyId: 'sediu', title: 'Sediu', options: pickupLocations, initialValue: pickupLocations.first),
    );
  }

  void _addDeliveryFields() {
    allItems.addAll([
      SelectionViewModel(
        keyId: 'country',
        title: 'Country',
        options: countries.map((c) => c.name).toList(),
        initialValue: selectedCountry.value?.name ?? (countries.isNotEmpty ? countries.first.name : ''),
      ),
      SelectionViewModel(
        keyId: 'region',
        title: 'Region',
        options: states.map((s) => s.name).toList(),
        initialValue: selectedState.value?.name ?? (states.isNotEmpty ? states.first.name : ''),
      ),
      SelectionViewModel(
        keyId: 'city',
        title: 'City',
        options: cities.map((c) => c.name).toList(),
        initialValue: selectedCity.value?.name ?? (cities.isNotEmpty ? cities.first.name : ''),
      ),
      TextFieldViewModel(
        keyId: 'postal_code',
        title: 'Postal code',
        initialValue: '',
        textInputType: TextInputType.number,
      ),
      TextFieldViewModel(keyId: 'address', title: 'Address', initialValue: ''),
      TextFieldViewModel(keyId: 'other_comments', title: 'Other Comments', initialValue: '', needValidation: false),
    ]);
  }

  DeliveryAddressViewModel toDeliveryAddressViewModel() {
    final type = fromLabel(deliveryTypeVM.value.options.firstWhere((e) => e.isSelected == true).titleKey);

    if (type == DeliveryType.pickup) {
      final pickupLocation = getViewModel<SelectionViewModel>('sediu')?.selectedValue.value ?? pickupLocations.first;
      final model = DeliveryAddressViewModel(deliveryType: type.label, pickupLocation: pickupLocation);
      addressVM.value = model;
      return model;
    } else {
      final country = getViewModel<SelectionViewModel>('country')?.selectedValue.value ?? '';
      final region = getViewModel<SelectionViewModel>('region')?.selectedValue.value ?? '';
      final city = getViewModel<SelectionViewModel>('city')?.selectedValue.value ?? '';
      final postalCode = getViewModel<TextFieldViewModel>('postal_code')?.placeholder ?? '';
      final address = getViewModel<TextFieldViewModel>('address')?.placeholder ?? '';
      final comments = getViewModel<TextFieldViewModel>('other_comments')?.placeholder ?? '';

      final areFieldsEmpty = country.isEmpty || region.isEmpty || city.isEmpty || postalCode.isEmpty || address.isEmpty;
      if (areFieldsEmpty) {
        final pickupLocation = pickupLocations.first;
        final model = DeliveryAddressViewModel(deliveryType: DeliveryType.pickup.label, pickupLocation: pickupLocation);
        addressVM.value = model;
        return model;
      }

      final model = DeliveryAddressViewModel(
        deliveryType: type.label,
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

  T? getViewModel<T extends BaseViewModel>(String keyId) {
    return allItems.firstWhereOrNull((item) => item is T && (item as dynamic).keyId == keyId) as T?;
  }
}
