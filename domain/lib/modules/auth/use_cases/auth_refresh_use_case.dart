import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/models/index.dart';

class AuthRefreshUseCase extends UseCase<AuthTokensEntity, AuthRefreshParams>{
  final AuthRepository authRepository;
  AuthRefreshUseCase({required this.authRepository});
  @override
  Future<Either<Failure, AuthTokensEntity>> call(params)async{
    return authRepository.refresh(params.refreshToken);
  }
}

class AuthRefreshParams {
  final String refreshToken;
  AuthRefreshParams({required this.refreshToken});
}