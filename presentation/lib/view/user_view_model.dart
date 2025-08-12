

import 'package:presentation/view/base_view_model.dart';

class UserViewModel extends BaseViewModel{
  final String name;
  final String surname;
  final String number;
  final String email;

  UserViewModel({required this.name, required this.surname, required this.number, required this.email});
}