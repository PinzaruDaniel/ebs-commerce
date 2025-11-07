import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

import '../models/index.dart';

class StreamUserUseCase implements UseCaseNoEitherNoParams<UserEntity?> {
  final UserInformationRepository userInformationRepository;

  StreamUserUseCase({required this.userInformationRepository});

  @override
  Stream<UserEntity?> call() {
    return userInformationRepository.getUser().distinct();
  }
}
