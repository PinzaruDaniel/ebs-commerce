import 'package:dio/dio.dart';

class Failure {
  final String message;
  final String? code;
  final String? type;
  final dynamic originalError;
  final Map<String, dynamic>? details;

  const Failure({
    required this.message,
    this.code,
    this.type,
    this.originalError,
    this.details,
  });

  factory Failure.dio(DioException e) {
    String errorType = e.type.toString().split('.').last;

    return Failure(
      message: e.message ?? 'Network Error',
      code: e.response?.statusCode?.toString(),
      type: 'dio_$errorType',
      originalError: e,
      details: {
        'response': e.response?.data,
        'stackTrace': e.stackTrace?.toString() ?? 'No stack trace',
      },
    );
  }

  factory Failure.exception(Exception e, [StackTrace? stackTrace]) {
    return Failure(
      message: e.toString(),
      type: 'exception',
      originalError: e,
      details: {
        'stackTrace': stackTrace?.toString() ?? 'No stack trace',
      },
    );
  }

  factory Failure.error(Object e, [StackTrace? stackTrace]) {
    return Failure(
      message: e.toString(),
      type: 'error',
      originalError: e,
      details: {
        'stackTrace': stackTrace?.toString() ?? 'No stack trace',
      },
    );
  }
}
