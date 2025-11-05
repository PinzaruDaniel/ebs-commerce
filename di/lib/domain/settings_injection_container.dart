import 'package:domain/modules/settings/settings_repository.dart';
import 'package:domain/modules/settings/use_cases/get_settings_use_case.dart';
import 'package:domain/modules/settings/use_cases/set_settings_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<SetSettingsUseCase>(
    () => SetSettingsUseCase(settingsRepository: dataDi<SettingsRepository>()),
  );
  dataDi.registerLazySingleton<GetSettingsUseCase>(
        () => GetSettingsUseCase(settingsRepository: dataDi<SettingsRepository>()),
  );
}
