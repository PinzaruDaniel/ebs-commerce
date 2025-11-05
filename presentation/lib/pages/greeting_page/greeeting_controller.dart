import 'package:domain/modules/settings/models/index.dart';
import 'package:domain/modules/settings/use_cases/get_settings_use_case.dart';
import 'package:domain/modules/settings/use_cases/set_settings_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class GreetingController extends GetxController {
  SetSettingsUseCase setSettingsUseCase = GetIt.instance<SetSettingsUseCase>();
  GetSettingsUseCase getSettingsUseCase = GetIt.instance<GetSettingsUseCase>();
  RxBool hasAgreedTerms = RxBool(false);

  void initFunctions() {
    getSettings();
  }

  Future<void> getSettings() async {
    await getSettingsUseCase.call().then((either) {
      either.fold(
        (failure) {
        },
        (entity) {
          hasAgreedTerms.value = entity.hasAgreedTerms;
        },
      );
    });
  }

  Future<void> setSettings() async {
    await setSettingsUseCase.call(SetSettingsParams(settings: SettingsEntity(hasAgreedTerms: hasAgreedTerms.value)));
  }
}
