import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/models/index.dart';

import '../../../core/usecase.dart';

class AuthLoginUseCase extends UseCase<AuthTokensEntity, AuthLoginParams> {
  final AuthRepository authRepository;

  AuthLoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AuthTokensEntity>> call(params) async {
    return authRepository.login(params.email, params.password);
  }
}

class AuthLoginParams {
  final String email;
  final String password;

  AuthLoginParams({required this.email, required this.password});
}
