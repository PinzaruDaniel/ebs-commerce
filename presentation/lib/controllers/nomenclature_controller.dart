import 'dart:async';

import 'package:domain/modules/delivery_address/use_cases/flags/get_flags_use_case.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart' as lib_phone_number;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/flags_mapper.dart';
import 'package:presentation/view/country_flag_dial_code_view_model.dart';

import '../util/widgets/failure_snack_bar_widget.dart';
import '../view/flag_view_model.dart';

class NomenclatureController extends GetxController {
  final GetFlagsUseCase getFlagsUseCase = GetIt.instance<GetFlagsUseCase>();
  RxList<FlagViewModel> flags = RxList([]);
  RxList<CountryFlagDialCodeViewModel> countriesFlagsDialCode = RxList([]);
  RxList<CountryFlagDialCodeViewModel> filteredCountriesFlagsDialCode = RxList([]);
  List<lib_phone_number.CountryWithPhoneCode> countries = [];
  Timer? debounce;


  @override
  void onInit() async {
    super.onInit();
    await lib_phone_number.init();
    countries = lib_phone_number.CountryManager().countries;
    await getFlags();
    mapFlagsToCountries();
    filteredCountriesFlagsDialCode.assignAll(countriesFlagsDialCode);
  }

  Future<void> getFlags() async {
    await getFlagsUseCase.call().then((either) {
      either.fold(
            (failure) {
          showFailureSnackBar(failure: failure);
        },
            (list) {
          final newItems = list.map((e) => e.toModel).toList();
          flags.assignAll(newItems);
        },
      );
    });
  }

  void mapFlagsToCountries() {
    countriesFlagsDialCode.clear();
    for (var flag in flags) {
      final country =
          countries.firstWhereOrNull(
                (c) => c.countryCode.toUpperCase() == flag.iso2.toUpperCase(),
          ) ??
              lib_phone_number.CountryWithPhoneCode.us();
      countriesFlagsDialCode.add(
        CountryFlagDialCodeViewModel(
          name: flag.name,
          iso2: flag.iso2,
          flag: flag.unicodeFlag,
          dialCode: country.phoneCode,
          phoneMaskMobileInternational: country.phoneMaskMobileInternational,
        ),
      );
    }
    countriesFlagsDialCode.sort((a, b) => a.name.compareTo(b.name));
  }

  void filterCountries(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer( Duration(milliseconds: 300), () {
      final q = query.toLowerCase().trim();

      if (q.isEmpty) {
        filteredCountriesFlagsDialCode.assignAll(countriesFlagsDialCode);
        return;
      }

      filteredCountriesFlagsDialCode.assignAll(
        countriesFlagsDialCode.where((item) {
          final flag = item.flag.toLowerCase();
          final name = item.name.toLowerCase();
          final dialCode = item.dialCode.replaceAll('+', '').toLowerCase();
          final iso = item.iso2.toLowerCase();

          return flag.contains(q) ||
              name.contains(q) ||
              dialCode.contains(q) ||
              iso.contains(q);
        }).toList(),
      );
    });
  }

  @override
  void onClose() {
    debounce?.cancel();
    super.onClose();
  }
}
