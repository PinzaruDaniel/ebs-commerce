
import 'dart:convert';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:dio/dio.dart';
import 'package:common/constants/logger.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:async_locks/async_locks.dart';

class RefreshInterceptor {
  final AuthApiService authApiService;
  final AuthLocalSource authLocalSource;
  final lock = Lock();
  bool successRegenerate = false;

  RefreshInterceptor({
    required this.authApiService,
    required this.authLocalSource,
  });

  Future<void> regenerateAccessToken() async {
    if (!lock.locked) {
      await _regenerate();
    } else {
      consoleLog('Waiting for another regeneration to complete');
      await lock.acquire();
    }
  }

  Future<void> _regenerate() async {
    successRegenerate = false;
    consoleLog('Starting token regeneration');
    lock.acquire();
    bool success = false;

    try {
      String? refreshToken = await authLocalSource.getRefreshToken();
      consoleLog('refreshToken: $refreshToken');
      if (refreshToken != null) {
        final response = await authApiService.refresh({'refreshToken': refreshToken});
        await authLocalSource.insertAccessToken(response);
        success = true;
      }
    } catch (e, stack) {
      consoleLog('Failed to regenerate token: $e');
      consoleLog(stack);
    }

    int totalWaiters = lock.waiters + 1;
    for (int i = 0; i < totalWaiters; i++) {
      lock.release();
    }

    successRegenerate = success;
    consoleLog('Token regeneration success: $success');
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
    consoleLog('onRequest interceptor: access=$accessToken, refresh=$refreshToken');

    if (accessToken == null || refreshToken == null) {
      return handler.reject(
        DioException(
          requestOptions: options,
          response: Response(requestOptions: options, statusCode: 401),
          error: {'reason': 'no_token'},
        ),
      );
    }

    options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is String) {
      try {
        response.data = jsonDecode(response.data);
      } catch (e) {
        consoleLog('Failed to decode JSON response: $e');
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.data is String) {
      try {
        err.response!.data = jsonDecode(err.response!.data);
      } catch (_) {}
    }

    consoleLog('onError interceptor: ${err.response?.data.runtimeType}, ${err.response?.data}');

    try {
      if (err.response != null &&
          err.response!.data is Map &&
          (err.response!.data as Map).containsKey('code') &&
          (err.response!.data as Map)['code'] == 'token_not_valid') {
        consoleLog('Token expired, starting refresh... ${refreshInterceptor.lock.locked}');

        await refreshInterceptor.regenerateAccessToken();

        if (refreshInterceptor.successRegenerate) {
          var newAccessToken = await refreshInterceptor.authLocalSource.getAccessToken();

          if (newAccessToken != null) {
            err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
            var newRequest = await dio.fetch(err.requestOptions);
            return handler.resolve(newRequest);
          } else {
            return handler.reject(
              DioException(
                requestOptions: err.requestOptions,
                response: Response(requestOptions: err.requestOptions, statusCode: 401),
                error: {'reason': 'all_logged_out'},
              ),
            );
          }

        } else {
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: {'reason': 'all_logged_out2'},
            ),
          );
        }
      }
    } catch (e, s) {
      consoleLog('Error in onError interceptor: $e, $s');
    }

    handler.reject(err);
  }
}