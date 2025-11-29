part of 'index.dart';

@freezed
abstract class SettingsEntity with _$SettingsEntity {
  const factory SettingsEntity({
    required bool hasAgreedTerms,
  })=_SettingsEntity;
}