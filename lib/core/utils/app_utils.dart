import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final appUtils = AppUtils._instance;
class AppUtils {
  AppUtils._privateConstructor();
  static final AppUtils _instance = AppUtils._privateConstructor();

  bool isValidEmail(String? email) {
    bool isValidEmail = email != null && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return isValidEmail;
  }

  bool isValidPassword(String? password) {
    bool isValidPassword = password != null && password.isNotEmpty;
    return isValidPassword;
  }

  void showSnackBar(String? text, {String message = ""}) {
    if (text.isNullEmptyOrWhitespace) {
      return;
    }

    Get.snackbar(
      text!,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.deepPurple,
      // icon: const Icon(Icons.add_alert),
    );
  }
}