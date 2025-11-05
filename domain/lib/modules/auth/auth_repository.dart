import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/auth/models/index.dart';
import 'package:domain/modules/user_information/models/index.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, AuthTokensEntity>> refresh(String refreshToken);
}
