import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/settings_mapper.dart';
import 'package:data/modules/settings/models/local/settings_box.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/settings/models/index.dart';
import 'package:objectbox/objectbox.dart';

abstract class SettingsLocalSource {
  Future<void> setSettings({required SettingsEntity settings});

  Future<Either<Failure, SettingsBox>> getSettings();
}

class SettingsLocalSourceImpl implements SettingsLocalSource {
  Box<SettingsBox> settingsBox;

  SettingsLocalSourceImpl({required this.settingsBox});

  @override
  Future<Either<Failure, SettingsBox>> getSettings() async {
    try {
      final settings = await settingsBox.getAllAsync();
      final setting=settings.last;
      return Right(setting);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<void> setSettings({required SettingsEntity settings}) async {
    settingsBox.putAsync(settings.toBox);
  }
}
