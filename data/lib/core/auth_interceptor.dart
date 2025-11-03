import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:dio/dio.dart';
import 'package:domain/core/usecase.dart';
import 'package:common/constants/logger.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import "package:async_locks/async_locks.dart";

class RefreshInterceptor {
  //final SessionExpiredCallback onSessionExpired;
  final AuthApiService authApiService;
  final AuthLocalSource authLocalSource;
  final lock = Lock();
  bool successRegenerate = false;

  RefreshInterceptor({
    //required this.onSessionExpired,
    required this.authApiService, required this.authLocalSource});

  Future<void> regenerateAccessToken() async {
    if (!lock.locked) {
      await _regenerate();
    } else {
      consoleLog('await hire');
      await lock.acquire();
    }
  }

  Future<void> _regenerate() async {
    successRegenerate = false;
    consoleLog('regenerateAccessToken');
    lock.acquire();
    consoleLog('regenerateAccessToken Next');
    bool success = false;
    try {
      String? refreshToken = await authLocalSource.getRefreshToken();
      consoleLog('regreshToken $refreshToken');
      try {
        final response = await authApiService.refresh(RefreshRequest(refreshToken!));
        await authLocalSource.insertAccessToken(response.accessToken!);
        success = true;
      } catch (e, stack) {
        consoleLog(stack);
      }
    } catch (e) {
      if (e is DioException) {
        consoleLog(e);
      }
    }
    int totalWaiters = lock.waiters + 1;
    for (int i = 0; i < totalWaiters; i++) {
      lock.release();
    }

    successRegenerate = success;
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  final RefreshInterceptor refreshInterceptor;
  final Dio dio;

  AuthInterceptor({required this.dio, required this.refreshInterceptor});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await refreshInterceptor.authLocalSource.getAccessToken();
    String? refreshToken = await refreshInterceptor.authLocalSource.getRefreshToken();
    consoleLog('onRequest interceptor acces: $accessToken || $refreshToken');

    if (accessToken == null || refreshToken == null) {
      final error = DioException(
        requestOptions: options,
        response: Response(requestOptions: options, statusCode: 401),
        error: {'no token': 'no token'},
      );
      return handler.reject(error);
    }

    accessToken = await refreshInterceptor.authLocalSource.getAccessToken();

    options.headers.addAll({'Authorization': '$accessToken'});
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    consoleLog('onError interceptoer ${err.response?.data.runtimeType}');
    try {
      if (err.response != null &&
          err.response!.data != null &&
          err.response!.data is Map &&
          (err.response!.data! as Map).containsKey('code') &&
          (err.response!.data! as Map)['code'] == 'token_not_valid') {
        consoleLog('ERROR AUTH is locked ${refreshInterceptor.lock.locked} ${err.requestOptions.uri}');
        await refreshInterceptor.regenerateAccessToken();

        consoleLog('Regenerate access token with success ${refreshInterceptor.successRegenerate}');
        if (refreshInterceptor.successRegenerate) {
          var newAccessTokenAfterExpire = await refreshInterceptor.authLocalSource.getAccessToken();

          if (newAccessTokenAfterExpire != null) {
            err.requestOptions.headers['Authorization'] = newAccessTokenAfterExpire;
          } else {
            consoleLog('handler.reject Expire');
            return handler.reject(
              DioException(
                requestOptions: err.requestOptions,
                response: Response(requestOptions: err.requestOptions, statusCode: 401),
                error: {'reason': 'all_logged_out'},
              ),
            );
          }
          var req = await dio.fetch(err.requestOptions);
          return handler.resolve(req);
        } else {
          consoleLog('handler.reject Expire2');
          //refreshInterceptor.onSessionExpired.call();
          return handler.reject(DioException(requestOptions: err.requestOptions, error: {'reason': 'all_logged_out2'}));
        }
      }
    } catch (E, s) {
      consoleLog('Error console log $E $s');
    }
    consoleLog('handle.reject $err');
    return handler.reject(err);
  }
}
