import 'package:domain/modules/user_information/models/index.dart';

abstract class UserInformationRepository{
  Future<void> setUsersLocalCache(UserEntity user);
  Future<UserEntity>getUserLocalCache();
}