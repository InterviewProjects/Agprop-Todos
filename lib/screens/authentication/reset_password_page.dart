import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/widgets/base_reactive_screen_widget.dart';
import 'package:flutter_base/core/widgets/common.dart';
import 'package:flutter_base/screens/authentication/authentication_controller.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends BaseReactiveScreenWidget<AuthenticationController> {
  ResetPasswordPage({required super.widgetKey, required super.params}) : super();

  @override
  AuthenticationController createController() => AuthenticationController(params: params);

  @override
  Widget buildView(BuildContext context) {
    super.buildView(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ['CB2B93'.toColor()!, '9546C4'.toColor()!, '5E61F4'.toColor()!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter Email Id", Icons.person_outline, false,
                            controller.resetPasswordEmailTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        firebaseUIButton(context, "Reset Password", controller.onResetPasswordTap)
                      ],
                    ),
                  )),
              Obx(() {
                return controller.showLoader.value ? Center(child: CircularProgressIndicator(color: '#CB2B93'.toColor()!,)) : const SizedBox.shrink();
              }),
            ],
          ),
      ),
    );
  }
}