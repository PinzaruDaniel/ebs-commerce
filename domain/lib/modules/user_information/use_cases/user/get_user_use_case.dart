import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

import '../../models/index.dart';

class GetUserUseCase implements UseCaseNoEitherNoParamsNoStream<UserEntity>{
  final UserInformationRepository userInformationRepository;
  GetUserUseCase({required this.userInformationRepository});

  @override
  Future<UserEntity> call() {
    return userInformationRepository.getUserLocalCache();
  }

}