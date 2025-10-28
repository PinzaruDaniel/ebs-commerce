import 'package:data/modules/user_information/models/local/user/user_box.dart';
import 'package:domain/modules/user_information/models/index.dart';

extension UserToBoxMapper on UserBox {
  UserEntity get toEntity {
    return UserEntity(id: id, name: name, surname: surname, number: number, dialCode: dialCode, email: email);
  }
}

extension UserToEntityMapper on UserEntity {
  UserBox get toBox {
    return UserBox(id: id, name: name, surname: surname, number: number, dialCode: dialCode, email: email);
  }
}
