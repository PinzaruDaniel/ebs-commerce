import 'package:data/modules/settings/models/local/settings_box.dart';
import 'package:domain/modules/settings/models/index.dart';

extension SettingsToEntityMappper on SettingsBox {
  SettingsEntity get toEntity {
    return SettingsEntity(hasAgreedTerms: hasAgreedTerms);
  }
}

extension SettingsToBoxMapper on SettingsEntity {
  SettingsBox get toBox {
    return SettingsBox(hasAgreedTerms: hasAgreedTerms);
  }
}
