import 'package:objectbox/objectbox.dart';

@Entity()
class SettingsBox {
  @Id()
  int id;
  bool hasAgreedTerms;
  SettingsBox({this.id = 0, this.hasAgreedTerms=false});
}
