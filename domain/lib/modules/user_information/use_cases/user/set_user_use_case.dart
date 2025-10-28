
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class SetUserUseCase extends UseCaseNoEither<void, SetUserParams> {
  final UserInformationRepository userInformationRepository;

  SetUserUseCase({required this.userInformationRepository});

  Future<void> call(params) async {
    return userInformationRepository.setUserLocalCache(params.user);
  }
}

class SetUserParams {
  final UserEntity user;

  SetUserParams({required this.user});
}
