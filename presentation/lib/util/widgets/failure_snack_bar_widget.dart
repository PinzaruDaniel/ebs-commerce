import 'package:flutter/material.dart';
import 'package:common/constants/failure_class.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';

void showFailureSnackBar({Failure? failure, String? fallbackMessage, String? title, bool isError = true}) {
  final message = failure?.message ?? fallbackMessage;

  Get.snackbar(
    title ?? 'Error',
    message!,
    backgroundColor: isError ? AppColors.red : AppColors.primary,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
    padding: const EdgeInsets.all(16),
    borderRadius: 20,
    icon: Icon(
      isError ? Icons.error : Icons.check_circle,
      color: Colors.white,
    ),
  );
}
