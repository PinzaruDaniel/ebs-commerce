import 'package:dio/dio.dart';
import 'package:domain/core/usecase.dart';
import 'package:common/constants/logger.dart';
import 'package:data/modules/auth/sources/remote/aut_api_service.dart';

class RefreshInterceptor{
  final SessionExpiredCallback onSessionExpired;

}