import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  static void info(String msg) {
    Get.snackbar('Info', msg,
        backgroundColor: Colors.blue.withValues(alpha: 0.7),
        colorText: Colors.white);
  }

  static void success(String msg) {
    Get.snackbar('Success', msg,
        backgroundColor: Colors.green.withValues(alpha: 0.7),
        colorText: Colors.white);
  }

  static void error(String msg) {
    Get.snackbar('Error', msg,
        backgroundColor: Colors.redAccent.withValues(alpha: 0.7),
        colorText: Colors.white);
  }
}
