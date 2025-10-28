import 'package:objectbox/objectbox.dart';

@Entity()
class PaymentMethodBox {
  @Id()
  int id;
  String key;
  String titleKey;

  PaymentMethodBox({this.id = 0, required this.key, required this.titleKey});
}
