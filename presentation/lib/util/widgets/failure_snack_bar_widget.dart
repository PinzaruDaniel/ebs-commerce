import 'package:flutter/material.dart';
import 'package:common/constants/failure_class.dart';
import 'package:get/get.dart';

void showFailureSnackBar(Failure failure) {
  if (Get.context != null) {
    final snackBar = SnackBar(
      content: Text(failure.message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 50, left:10, right: 10),
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35))),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}

