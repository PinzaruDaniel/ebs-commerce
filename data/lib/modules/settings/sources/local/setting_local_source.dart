import 'package:data/mapper/settings_mapper.dart';
import 'package:data/modules/settings/models/local/settings_box.dart';
import 'package:domain/modules/settings/models/index.dart';
import 'package:objectbox/objectbox.dart';

abstract class SettingsLocalSource {
  Future<void> setSettings({required SettingsEntity settings});

  Future<SettingsBox?> getSettings();
}

class SettingsLocalSourceImpl implements SettingsLocalSource {
  Box<SettingsBox> settingsBox;

  SettingsLocalSourceImpl({required this.settingsBox});

  @override
  Future<SettingsBox?> getSettings() async {
    final settings = await settingsBox.getAllAsync();
    if (settings.isEmpty) return null;
    return settings.last;
  }

  @override
  Future<void> setSettings({required SettingsEntity settings}) async {
    settingsBox.putAsync(settings.toBox);
  }
}
