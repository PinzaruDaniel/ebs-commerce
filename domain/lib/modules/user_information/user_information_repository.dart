import 'package:domain/modules/user_information/models/index.dart';

abstract class UserInformationRepository {
  Future<void> setUserProfile(UserEntity user);
  Future<UserEntity?> getUserProfile();
}
