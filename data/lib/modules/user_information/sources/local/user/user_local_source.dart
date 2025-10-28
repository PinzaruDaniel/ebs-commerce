import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user_information/models/local/user/user_box.dart';
import 'package:data/objectbox.g.dart';
import 'package:domain/modules/user_information/models/index.dart';

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
    print(' this is user from local data ${users.last.name}');
    return users.last;
  }
}
