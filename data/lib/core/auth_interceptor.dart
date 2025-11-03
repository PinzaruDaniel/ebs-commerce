import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:dio/dio.dart';
import 'package:domain/core/usecase.dart';
import 'package:common/constants/logger.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import "package:async_locks/async_locks.dart";

class RefreshInterceptor {
  final SessionExpiredCallback onSessionExpired;
  final AuthApiService authApiService;
  final AuthLocalSource authLocalSource;
  final lock=Lock();
  bool successRegenerate=false;

  RefreshInterceptor({required this.onSessionExpired, required this.authApiService, required this.authLocalSource});
}
