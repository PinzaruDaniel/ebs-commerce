import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/settings/models/index.dart';

abstract class SettingsRepository{
Future<Either<Failure, SettingsEntity>> getSettings();
Future<void> setSettings(SettingsEntity settings);
}