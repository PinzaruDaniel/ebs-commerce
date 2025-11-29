import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/settings/models/index.dart';
import 'package:domain/modules/settings/settings_repository.dart';

class GetSettingsUseCase extends UseCaseNoParams<SettingsEntity> {
  final SettingsRepository settingsRepository;

  GetSettingsUseCase({required this.settingsRepository});

  @override
  Future<Either<Failure, SettingsEntity>> call() {
    return settingsRepository.getSettings();
  }
}
