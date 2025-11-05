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
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final response = await apiService.login({"email": email, "password": password});
     /* await localSource.insertTokens(response.accessToken??'', response.refreshToken??'');
      final accessToken= await localSource.getAccessToken();*/
      if(response is String ){
        var result=jsonDecode(response);
        consoleLog('result decoded ${result.runtimeType}');
        if(result is Map<String, dynamic>) {
          var fromJSON= AuthTokensApiDto.fromJson(result);
          consoleLog('fro json variable $fromJSON');
        }
      }
      consoleLog("accessToken from repo impl ${response.runtimeType}");
      return Right(null);
    } catch (e, stackTrace) {
      consoleLog('e data ${e} $stackTrace');

      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> refresh(String refreshToken) async {
    try {
      final response = await apiService.refresh({'refreshToken': refreshToken});
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}
