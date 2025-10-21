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
  List<lib_phone_number.CountryWithPhoneCode> countries=[];
  @override
  void onInit() async {
    super.onInit();
    await lib_phone_number.init();
     countries = lib_phone_number.CountryManager().countries;
    await getFlags();
    mapFlagsToCountries();
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
    for (var flag in flags) {
      final country =
          lib_phone_number.CountryManager().countries.firstWhereOrNull(
            (c) => c.countryCode.toUpperCase() == flag.iso2.toUpperCase(),
          ) ??
          lib_phone_number.CountryWithPhoneCode.us();
      countriesFlagsDialCode.add(
        CountryFlagDialCodeViewModel(
          countryName: flag.name,
          countryCode: flag.iso2,
          countryFlag: flag.unicodeFlag,
          countryDialCode: country.phoneCode,
          phoneMaskMobileInternational: country.phoneMaskMobileInternational,
        ),
      );
    }
    countriesFlagsDialCode.sort((a, b) => a.countryName.compareTo(b.countryName));
  }
}
