import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:flutter_base/core/utils/app_utils.dart';
import 'package:flutter_base/screens/todos/list/todos_page.dart';
import 'package:get/get.dart';

class AuthenticationController extends BaseController {
  AuthenticationController({required super.params});

  Rx<bool> showLoader = false.obs;

  /// login screen
  final TextEditingController signInEmailTextController = TextEditingController();
  final TextEditingController signInPasswordTextController = TextEditingController();

  /// sign up screen
  final TextEditingController signUpEmailTextController = TextEditingController();
  final TextEditingController signUpPasswordTextController = TextEditingController();
  final TextEditingController signUpConfirmPasswordTextController = TextEditingController();

  /// reset password
  final TextEditingController resetPasswordEmailTextController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    _onInit();
  }

  void onSignInTap() => _onSignInTap();

  void onSignUpTap() => _onSignUpTap();

  void onResetPasswordTap() => _onResetPasswordTap();

  void _onInit() {
      final userId = authenticationUseCase.getUserId();
      if (userId.isNullEmptyOrWhitespace == false) {
        /// redirection to todos page
        _redirectToTodosPage();
      }
  }

  void _onSignInTap() async {
    final email = signInEmailTextController.text;
    if (appUtils.isValidEmail(email) == false) {
      appUtils.showSnackBar('Please Enter valid email address');
      return;
    }

    final password = signInPasswordTextController.text;
    if (appUtils.isValidPassword(password) == false) {
      appUtils.showSnackBar('Please Enter valid password');
      return;
    }

    showLoader.value = true;

    bool isSignedInSuccessfully =
        await authenticationUseCase.signInWithEmailAndPassword(email: signInEmailTextController.text, password: signInPasswordTextController.text);
    if (isSignedInSuccessfully) {
      /// redirection to todos page
      _redirectToTodosPage();
    } else {
      appUtils.showSnackBar('Signup error, please try again!');
    }

    showLoader.value = false;
  }

  void _onSignUpTap() async {
    final email = signUpEmailTextController.text;
    if (appUtils.isValidEmail(email) == false) {
      appUtils.showSnackBar('Please Enter valid email address');
      return;
    }

    final password = signUpPasswordTextController.text;
    if (appUtils.isValidPassword(password) == false) {
      appUtils.showSnackBar('Please Enter valid password');
      return;
    }

    final confirmPassword = signUpConfirmPasswordTextController.text;
    if (password != confirmPassword) {
      appUtils.showSnackBar('Both password do not match');
      return;
    }

    showLoader.value = true;

    bool isSignedUpSuccessfully = await authenticationUseCase.createUserWithEmailAndPassword(
        email: signUpEmailTextController.text, password: signUpPasswordTextController.text);
    if (isSignedUpSuccessfully) {
      /// redirection to todos page
      _redirectToTodosPage();
    } else {
      appUtils.showSnackBar('Signing error, please try again!');
    }

    showLoader.value = false;
  }

  void _onResetPasswordTap() async {
    final email = resetPasswordEmailTextController.text;
    if (appUtils.isValidEmail(email) == false) {
      appUtils.showSnackBar('Please Enter valid email address');
      return;
    }

    showLoader.value = true;

    bool isResetPasswordSuccessfully = await authenticationUseCase.sendPasswordResetEmail(email: resetPasswordEmailTextController.text);
    if (isResetPasswordSuccessfully) {
      appUtils.showSnackBar('Reset link send to your email, please check!');

      Navigator.pop(Get.context!);
    } else {
      appUtils.showSnackBar('Password resetting error, please try again!');
    }

    showLoader.value = false;
  }

  void _redirectToTodosPage() {
    Navigator.pushAndRemoveUntil(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => TodosPage(
          widgetKey: const ValueKey('TodosPage'),
          params: { ...params },
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }
}