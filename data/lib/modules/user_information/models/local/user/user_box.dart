import 'package:objectbox/objectbox.dart';

@Entity()
class UserBox {
  @Id()
  int id;
  String name;
  String surname;
  String number;
  String dialCode;
  String email;
  UserBox({
    this.id=0,
    required this.name,
    required this.surname,
    required this.number,
    required this.dialCode,
    required this.email,
});
}
