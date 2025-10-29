import 'package:domain/modules/user_information/models/index.dart';

abstract class UserInformationRepository {
  Future<void> setUser(UserEntity user);
  Future<UserEntity?> getUser();
}
