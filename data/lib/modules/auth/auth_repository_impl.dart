import 'dart:convert';

import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/auth_tokens_mapper.dart';
import 'package:data/modules/auth/models/remote/index.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/models/index.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;
  final AuthLocalSource localSource;

  AuthRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<Either<Failure, AuthTokensEntity>> login(String email, String password) async {
    try {
      final response = await apiService.login({"email": email, "password": password});
      var result = jsonDecode(response);
      var authTokenApi = AuthTokensApiDto.fromJson(result);
      return Right(authTokenApi.toEntity);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<void> insertTokens(String accessToken, String refreshToken) async {
    localSource.insertTokens(accessToken, refreshToken);
    consoleLog('inserted Tokens: $accessToken $refreshToken');
  }
}
