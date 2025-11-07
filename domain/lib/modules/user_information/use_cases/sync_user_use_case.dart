import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/models/index.dart';

import '../user_information_repository.dart';

class SyncUserUseCase extends UseCaseNoParams<UserEntity> {
  final UserInformationRepository userInformationRepository;

  SyncUserUseCase({required this.userInformationRepository});

  @override
  Future<Either<Failure, UserEntity>> call() async {
    final either = await userInformationRepository.getUserFromApi();
    either.fold((failure) {}, (userApi) {
      userInformationRepository.setUser(userApi);
      consoleLog('userApi photo: ${userApi.imageUrl??'null'}');
    });
    return either;
  }
}
