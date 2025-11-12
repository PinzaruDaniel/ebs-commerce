// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:common/constants/logger.dart';
import 'package:domain/modules/delivery_address/use_cases/cities/get_cities_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/countries/get_countries_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/states/get_states_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/util/enum/map_enums.dart';
import 'package:presentation/util/mapper/cities_response_entity_mapper.dart';
import 'package:presentation/util/mapper/countries_entity_mapper.dart';
import 'package:presentation/util/mapper/states_entity_mapper.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/city_view_model.dart';
import 'package:presentation/view/country_view_model.dart';
import 'package:presentation/view/delivery_address_view_model.dart';
import 'package:presentation/view/state_view_model.dart';

import '../../util/enum/enums.dart';
import '../../util/widgets/failure_snack_bar_widget.dart';
import '../../view/pickup_location_view_model.dart';

class DeliveryAddressController extends GetxController {
  final GetCountriesUseCase getCountriesUseCase = GetIt.instance<GetCountriesUseCase>();
  final GetStatesUseCase getStatesUseCase = GetIt.instance<GetStatesUseCase>();
  final GetCitiesUseCase getCitiesUseCase = GetIt.instance<GetCitiesUseCase>();
  RxList<BaseViewModel> allItems = RxList([]);
  RxList<CountryViewModel> countries = RxList([]);
  RxList<StateViewModel> states = RxList([]);
  RxList<CityViewModel> cities = RxList([]);
  Rxn<DeliveryAddressViewModel> deliveryAddressVM = Rxn<DeliveryAddressViewModel>();
  Rxn<CountryViewModel> selectedCountry = Rxn<CountryViewModel>();
  Rxn<StateViewModel> selectedState = Rxn<StateViewModel>();
  Rxn<CityViewModel> selectedCity = Rxn<CityViewModel>();
  Rxn<String> postalCode = Rxn<String>();
  Rxn<String> address = Rxn<String>();
  Rxn<String> comments = Rxn<String>();
  Rxn<PickupLocationViewModel> pickupLocation = Rxn<PickupLocationViewModel>();

  RxBool isLoadingCountries = RxBool(true);
  RxBool isLoadingStates = RxBool(true);
  RxBool isLoadingCities = RxBool(true);

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

  Future<void> initItems(DeliveryAddressViewModel? deliveryAddressVM) async {
    this.deliveryAddressVM.value = deliveryAddressVM;

    if (countries.isEmpty) {
      await loadCountries();
    }
    if (deliveryAddressVM != null) {
      final selectedOption = deliveryTypeVM.value.options.firstWhere(
        (e) => e.deliveryType.name.toLowerCase() == deliveryAddressVM.deliveryType.toLowerCase(),
        orElse: () => deliveryTypeVM.value.options.first,
      );
      for (final option in deliveryTypeVM.value.options) {
        option.isSelected = (option == selectedOption);
      }
      deliveryTypeVM.refresh();
      if (deliveryAddressVM.pickupLocation != null) {
        pickupLocation.value = pickupLocations.firstWhereOrNull((e) => e.address == deliveryAddressVM.pickupLocation);
      }

      if (deliveryAddressVM.postalCode != null) {
        postalCode.value = deliveryAddressVM.postalCode;
        consoleLog('postal_code ${postalCode.value}');
      }
      if (deliveryAddressVM.address != null) {
        address.value = deliveryAddressVM.address;
        consoleLog('address ${address.value}');
      }
      if (deliveryAddressVM.comments != null) {
        comments.value = deliveryAddressVM.comments;
      }

      if (deliveryAddressVM.country != null) {
        selectedCountry.value = countries.firstWhereOrNull((c) => c.name == deliveryAddressVM.country);
        if (selectedCountry.value != null) {
          consoleLog('selectedCountry ${selectedCountry.value?.name}');
          await loadStates(selectedCountry.value!);
        }
      }

      if (deliveryAddressVM.region != null) {
        selectedState.value = states.firstWhereOrNull((s) => s.name == deliveryAddressVM.region);
        consoleLog('selectedRegion ${selectedState.value?.name}');
        if (selectedCountry.value != null && selectedState.value != null) {
          await loadCities(selectedCountry.value!, selectedState.value!, selectedCityName: deliveryAddressVM.city);
        }
      }

      if (deliveryAddressVM.city != null) {
        selectedCity.value = cities.firstWhereOrNull((c) => c.name == deliveryAddressVM.city);
        consoleLog('selectedCity ${selectedCity.value?.name}');
      }
    }
    updateAllItems();
    toDeliveryAddressViewModel();
  }

  Future<void> loadCountries() async {
    final result = await getCountriesUseCase();
    result.fold(
      (failure) {
        showFailureSnackBar(failure: failure);
      },
      (list) {
        countries.value = list.map((c) => c.toViewModel).toList();

        if (selectedCountry.value == null && countries.isNotEmpty) {
          selectedCountry.value = null;
          selectedState.value = null;
          selectedCity.value = null;
          states.clear();
          cities.clear();
          if (deliveryTypeVM.value.options.any((e) => e.isSelected && fromLabel(e.titleKey) != DeliveryType.pickup)) {
            updateAllItems();
          }
        }
        isLoadingCountries.value = false;
      },
    );
  }

  Future<void> loadStates(CountryViewModel country) async {
    if (country.name.isEmpty) return;

    final params = GetStatesUseCaseParams(country: country.iso2);
    final result = await getStatesUseCase(params);

    result.fold(
      (failure) {
        showFailureSnackBar(failure: failure);
      },
      (list) {
        states.value = list.map((e) => e.toViewModel).toList();
        selectedState.value = null;
        selectedCity.value = null;
        cities.clear();
        updateAllItems();
        isLoadingStates.value = false;
      },
    );
  }

  Future<void> loadCities(CountryViewModel country, StateViewModel state, {String? selectedCityName}) async {
    if (country.name.isEmpty || state.code.isEmpty) return;
    final params = GetCitiesUseCaseParams(country: country.name, state: state.name);
    final result = await getCitiesUseCase(params);

    result.fold(
      (failure) {
        showFailureSnackBar(failure: failure);
      },
      (entity) {
        cities.value = entity.toViewModelList;
        if (selectedCityName != null) {
          selectedCity.value = cities.firstWhereOrNull((c) => c.name == selectedCityName);
        } else {
          selectedCity.value = null;
        }
        updateAllItems();
        isLoadingCities.value = false;
      },
    );
  }

  DeliveryType fromLabel(String label) {
    return DeliveryType.values.firstWhere((e) => e.label == label);
  }

  Future<void> removeAllItemsAnimated() async {
    while (allItems.length > 1) {
      final _ = allItems.removeLast();
      update();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  Future<void> updateAllItems() async {
    final deliveryItem = deliveryTypeVM.value;

    allItems.value = [deliveryItem];
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
      SelectionViewModel<String>(
        keyId: 'sediu',
        title: AppTexts.office,
        options: pickupLocations.map((e) {
          return OptionViewModel(data: e.address, titleKey: e.address);
        }).toList(),
        initialValue: OptionViewModel(
          data: pickupLocation.value ?? pickupLocations.first.address,
          titleKey: pickupLocation.value?.address ?? pickupLocations.first.address,
        ),
      ),
    );
  }

  void _addDeliveryFields() {
    allItems.addAll([
      SelectionViewModel<String>(
        keyId: 'country',
        title: AppTexts.country,
        options: countries.value.map((e) {
          return OptionViewModel(data: e, titleKey: e.name);
        }).toList(),
        initialValue: OptionViewModel(
          data: selectedCountry.value,
          titleKey: selectedCountry.value?.name ?? AppTexts.selectCountry,
        ),
      ),
      SelectionViewModel<String>(
        keyId: 'region',
        title: AppTexts.region,
        options: states.value.map((e) {
          return OptionViewModel(data: e, titleKey: e.name);
        }).toList(),
        initialValue: OptionViewModel(
          data: selectedState.value,
          titleKey: selectedState.value?.name ?? AppTexts.selectRegion,
        ),
      ),
      SelectionViewModel<String>(
        keyId: 'city',
        title: AppTexts.city,
        options: cities.value.map((e) {
          return OptionViewModel(data: e, titleKey: e.name);
        }).toList(),
        initialValue: OptionViewModel(
          data: selectedCity.value,
          titleKey: selectedCity.value?.name ?? AppTexts.selectCity,
        ),
      ),
      TextFieldViewModel(
        hintText: 'MD-2059',
        keyId: 'postal_code',
        title: AppTexts.postalCode,
        initialValue: postalCode.value ?? '',
        textInputType: TextInputType.number,
      ),
      TextFieldViewModel(
        hintText: 'Calea Orheiului, 65',
        keyId: 'address',
        title: AppTexts.address,
        initialValue: address.value ?? '',
      ),
      TextFieldViewModel(
        hintText: 'Anything you want',
        keyId: 'other_comments',
        title: AppTexts.otherComments,
        initialValue: comments.value ?? '',
        isRequiredValidation: false,
        minLines: 3,
      ),
    ]);
  }

  DeliveryAddressViewModel toDeliveryAddressViewModel() {
    final type = DeliveryTypeMapper.fromLabel(deliveryTypeVM.value.options.firstWhere((e) => e.isSelected).titleKey);
    if (type == DeliveryType.pickup) {
      final pickupLocation =
          getViewModel<SelectionViewModel>('sediu')?.selectedItem.titleKey ?? pickupLocations.first.address;
      final model = DeliveryAddressViewModel(deliveryType: type.label, pickupLocation: pickupLocation);
      deliveryAddressVM.value = model;
      return model;
    } else {
      final country = getViewModel<SelectionViewModel>('country')?.selectedItem.titleKey ?? '';
      final region = getViewModel<SelectionViewModel>('region')?.selectedItem.titleKey ?? '';
      final city = getViewModel<SelectionViewModel>('city')?.selectedItem.titleKey ?? '';
      final postalCode = getViewModel<TextFieldViewModel>('postal_code')?.placeholder ?? '';
      final address = getViewModel<TextFieldViewModel>('address')?.placeholder ?? '';
      final comments = getViewModel<TextFieldViewModel>('other_comments')?.placeholder ?? '';

      final areFieldsEmpty = country.isEmpty || region.isEmpty || city.isEmpty || postalCode.isEmpty || address.isEmpty;
      if (areFieldsEmpty) {
        final pickupLocation = pickupLocations.first.address;
        final model = DeliveryAddressViewModel(deliveryType: DeliveryType.pickup.label, pickupLocation: pickupLocation);
        deliveryAddressVM.value = model;
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
      deliveryAddressVM.value = model;
      //todo: to think her
      currentUserController.userVM.value?.deliveryAddressViewModel=model;
      return model;
    }
  }

  T? getViewModel<T extends BaseViewModel>(String keyId) {
    return allItems.firstWhereOrNull((item) => item is T && (item as dynamic).keyId == keyId) as T?;
  }
}
