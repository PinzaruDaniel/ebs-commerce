import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/models/local/user_box.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:objectbox/objectbox.dart';

abstract class UserLocalSource {
  Future<void> setUser({required UserEntity user});

  Future<UserBox> getUser();
}

class UserLocalDataSourceImpl implements UserLocalSource {
  Box<UserBox> userBox;

  UserLocalDataSourceImpl({required this.userBox});

  @override
  Future<void> setUser({required UserEntity user}) async {
    userBox.put(user.toBox);
  }

  @override
  Future<UserBox> getUser() async {
    final users = userBox.getAll();
    return users.last;
  }
}
