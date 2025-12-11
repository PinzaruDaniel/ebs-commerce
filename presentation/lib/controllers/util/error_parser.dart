import 'dart:convert';

import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:presentation/util/resources/app_texts.dart';

class ErrorParser {
  String handleError({required Failure failure, String fallbackMessage = ''}) {
    if (failure.type == 'dio_connectionError' ||
        failure.type == 'dio_connectionTimeout' ||
        failure.type == 'dio_unknown') {
      return AppTexts.serverError;
    }
    final details = failure.details;
    return details?['response']['error'];
  }
}
