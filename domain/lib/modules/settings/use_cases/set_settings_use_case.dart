import 'package:domain/core/usecase.dart';
import 'package:domain/modules/settings/models/index.dart';
import 'package:domain/modules/settings/settings_repository.dart';

class SetSettingsUseCase extends UseCaseNoEither<void, SetSettingsParams> {
  final SettingsRepository settingsRepository;

  SetSettingsUseCase({required this.settingsRepository});

  @override
  Future<void> call(params) {
    return settingsRepository.setSettings(params.settings);
  }
}

class SetSettingsParams {
  final SettingsEntity settings;

  SetSettingsParams({required this.settings});
}
