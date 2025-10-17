import 'package:domain/modules/delivery_address/use_cases/flags/get_flags_use_case.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart'
    as lib_phone_number;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/flags_mapper.dart';
import 'package:presentation/view/country_flag_dial_code_view_model.dart';

import '../util/widgets/failure_snack_bar_widget.dart';
import '../view/flag_view_model.dart';

class NomenclatureController extends GetxController {
  final GetFlagsUseCase getFlagsUseCase = GetIt.instance<GetFlagsUseCase>();
  RxList<FlagViewModel> flags = RxList([]);
  List<CountryFlagDialCodeViewModel> countriesFlagsDialCode = [];
  final countries = lib_phone_number.CountryManager().countries;

  @override
  void onInit() async {
    super.onInit();
    await lib_phone_number.init();
    await getFlags();
    mapFlagsToCountries();
  }

  Future<void> getFlags() async {
    await getFlagsUseCase.call().then((either) {
      either.fold(
            (failure) {
        },
            (list) {
          final newItems = list.map((e) => e.toModel).toList();
          flags.assignAll(newItems);
        },
      );
    });
  }

  void mapFlagsToCountries() {
    countriesFlagsDialCode = [];

    for (var flag in flags) {
      final country = countries.firstWhere(
            (c) => c.countryCode.toUpperCase() == flag.iso2.toUpperCase(),
        orElse: () => lib_phone_number.CountryWithPhoneCode.us(),
      );
      countriesFlagsDialCode.add(
        CountryFlagDialCodeViewModel(
          countryName: flag.name,
          countryCode: flag.iso2,
          countryFlag: flag.unicodeFlag,
          countryDialCode: country.phoneCode,
        ),
      );
    }
  }
}