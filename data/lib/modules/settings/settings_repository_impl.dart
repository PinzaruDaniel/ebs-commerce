import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/settings_mapper.dart';
import 'package:data/modules/settings/sources/local/settings_local_source.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/settings/models/index.dart';
import 'package:domain/modules/settings/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalSource settingsLocalSource;

  SettingsRepositoryImpl({required this.settingsLocalSource});

  @override
  Future<Either<Failure, SettingsEntity>> getSettings() async {
    try {
      final result = await settingsLocalSource.getSettings();
      return result.map((settingsBox) => settingsBox.toEntity);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }


  @override
  Future<void> setSettings(SettingsEntity settings) async {
   return settingsLocalSource.setSettings(settings: settings);
  }
}
