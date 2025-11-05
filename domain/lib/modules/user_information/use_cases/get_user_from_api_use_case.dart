import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/models/index.dart';

import '../user_information_repository.dart';

class GetUserFromApiUseCase extends UseCaseNoParams<UserEntity>{
  final UserInformationRepository userInformationRepository;
  GetUserFromApiUseCase({required this.userInformationRepository});

  @override
  Future<Either<Failure, UserEntity>> call(){
    return userInformationRepository.getUserFromApi();
  }
}