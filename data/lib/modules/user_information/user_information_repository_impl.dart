import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user_information/sources/local/user/user_local_source.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class UserInformationRepositoryImpl implements UserInformationRepository{
  final UserLocalSource userLocalSource;
  UserInformationRepositoryImpl({required this.userLocalSource});

  @override
  Future<void> setUsersLocalCache(UserEntity user){
    return userLocalSource.setUser(user: user);
  }

  @override
  Future<UserEntity> getUserLocalCache() async{
    final user= await userLocalSource.getUser();
    return user.toEntity;
  }
}