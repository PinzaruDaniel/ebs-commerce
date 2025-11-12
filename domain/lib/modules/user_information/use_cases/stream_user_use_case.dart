import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

import '../models/index.dart';

class StreamUserUseCase implements UseCaseStream<UserEntity?, StreamUserParams> {
  final UserInformationRepository userInformationRepository;

  StreamUserUseCase({required this.userInformationRepository});

  @override
  Stream<UserEntity?> call(params) {
    return userInformationRepository.getUser(params.id).distinct();
  }
}

class StreamUserParams {
  final int id;
  StreamUserParams({required this.id});
}
