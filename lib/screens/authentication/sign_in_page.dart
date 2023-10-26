// ignore_for_file: library_private_types_in_public_api

import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/widgets/base_reactive_screen_widget.dart';
import 'package:flutter_base/core/widgets/common.dart';
import 'package:flutter_base/screens/authentication/authentication_controller.dart';
import 'package:flutter_base/screens/authentication/reset_password_page.dart';
import 'package:flutter_base/screens/authentication/sign_up_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends BaseReactiveScreenWidget<AuthenticationController> {
  SignInPage({required super.widgetKey, required super.params}) : super();

  @override
  AuthenticationController createController() => AuthenticationController(params: params);

  @override
  Widget buildView(BuildContext context) {
    super.buildView(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ["#CB2B93".toColor()!, "#9546C4".toColor()!, "#5E61F4".toColor()!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.15, 20, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome to AgProp\nTodos',
                      style: GoogleFonts.novaSlim(color: '#FFFFFF'.toColor()!.withOpacity(0.8), fontSize: 32, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false, controller.signInEmailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outline, true, controller.signInPasswordTextController),
                    const SizedBox(
                      height: 5,
                    ),
                    _forgetPassword(context),
                    firebaseUIButton(context, "Sign In", controller.onSignInTap),
                    _signUpOption(context)
                  ],
                ),
              ),
            ),
            Obx(() {
              return controller.showLoader.value ? Center(child: CircularProgressIndicator(color: '#CB2B93'.toColor()!,)) : const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }

  Row _signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage(widgetKey: const ValueKey('SignUpPage'), params: { ...params, 'timeStamp': DateTime.now().millisecondsSinceEpoch })));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPasswordPage(widgetKey: const ValueKey('ResetPasswordPage'), params: { ...params, 'timeStamp': DateTime.now().millisecondsSinceEpoch }))),
      ),
    );
  }
}
