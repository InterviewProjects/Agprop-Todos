import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/core_ui_extension.dart';
import 'package:flutter_base/core/widgets/base_reactive_screen_widget.dart';
import 'package:flutter_base/screens/profile/profile_controller.dart';
import 'package:flutter_base/screens/profile/profile_gender_selection.dart';
import 'package:flutter_base/screens/profile/profile_text_field.dart';
import 'package:get/get.dart';
class ProfilePage extends BaseReactiveScreenWidget<ProfileController> {
  ProfilePage({required super.widgetKey, required super.params}) : super();

  @override
  ProfileController createController() => ProfileController(params: params);

  @override
  Widget buildView(BuildContext context) {
    super.buildView(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ["#CB2B93".toColor()!, "#9546C4".toColor()!, "#5E61F4".toColor()!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 64,),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: const Icon(Icons.arrow_back, size: 32, color: Colors.white,).onTap(() { controller.onBackTap(); }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: const Icon(Icons.logout_sharp, size: 28, color: Colors.white,).onTap(() { controller.onLogoutTap(); }),
                ),
                // const SizedBox(width: 12,),
              ],
            ),
            const SizedBox(height: 120,),
            Obx(() {
              return Stack(
                children: [
                  if (controller.profileItem.value.userId.isNullEmptyOrWhitespace == false)
                    Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: ["#FFFFFF".toColor()!, "#FFFFFF".toColor()!, "#FFFFFF".toColor()!],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        ListView(
                          children: [
                            const SizedBox(height: 80,),
                            ProfileTextField(
                              widgetKey: const ValueKey('email'),
                              params: {
                                ProfileTextFieldController.defaultTextKey: controller.profileItem.value.emailId,
                                ProfileTextFieldController.defaultEnabledKey: false,
                                'timeStamp': DateTime.now().millisecondsSinceEpoch,
                              },
                            ),
                            ProfileTextField(
                              widgetKey: const ValueKey('name'),
                              params: {
                                ProfileTextFieldController.defaultTextKey: controller.profileItem.value.name,
                                ProfileTextFieldController.defaultHintKey: 'Start typing your name...',
                                ProfileTextFieldController.defaultKeyboardTypeKey: TextInputType.text,
                                ProfileTextFieldController.onSubmitKey: controller.onNameSubmit,
                                'timeStamp': DateTime.now().millisecondsSinceEpoch,
                              },
                            ),
                            // _chooseGenderWidget(),
                            ProfileGenderSelection(
                              widgetKey: const ValueKey('gender'),
                              params: {
                                ProfileGenderSelectionController.selectedTextKey: controller.profileItem.value.gender,
                                ProfileGenderSelectionController.onSubmitKey: controller.onGenderSubmit,
                                'timeStamp': DateTime.now().millisecondsSinceEpoch,
                              },
                            ),
                            ProfileTextField(
                              widgetKey: const ValueKey('city'),
                              params: {
                                ProfileTextFieldController.defaultTextKey: controller.profileItem.value.city,
                                ProfileTextFieldController.defaultHintKey: 'Start typing your city...',
                                ProfileTextFieldController.defaultKeyboardTypeKey: TextInputType.text,
                                ProfileTextFieldController.onSubmitKey: controller.onCitySubmit,
                                'timeStamp': DateTime.now().millisecondsSinceEpoch,
                              },
                            ),
                            ProfileTextField(
                              widgetKey: const ValueKey('pin-code'),
                              params: {
                                ProfileTextFieldController.defaultTextKey: controller.profileItem.value.pinCode,
                                ProfileTextFieldController.defaultHintKey: 'Start typing your pin-code...',
                                ProfileTextFieldController.defaultKeyboardTypeKey: TextInputType.phone,
                                ProfileTextFieldController.onSubmitKey: controller.onPinCodeSubmit,
                                ProfileTextFieldController.defaultMaxLengthKey: 6,
                                'timeStamp': DateTime.now().millisecondsSinceEpoch,
                              },
                            ),
                            ProfileTextField(
                              widgetKey: const ValueKey('linkedin'),
                              params: {
                                ProfileTextFieldController.defaultTextKey: controller.profileItem.value.linkedin,
                                ProfileTextFieldController.defaultHintKey: 'Start typing link to your linkedin page...',
                                ProfileTextFieldController.defaultKeyboardTypeKey: TextInputType.text,
                                ProfileTextFieldController.onSubmitKey: controller.onLinkedinSubmit,
                                'timeStamp': DateTime.now().millisecondsSinceEpoch,
                              },
                            ),
                            ProfileTextField(
                              widgetKey: const ValueKey('facebook'),
                              params: {
                                ProfileTextFieldController.defaultTextKey: controller.profileItem.value.facebook,
                                ProfileTextFieldController.defaultHintKey: 'Start typing link to your facebook page...',
                                ProfileTextFieldController.defaultKeyboardTypeKey: TextInputType.text,
                                ProfileTextFieldController.onSubmitKey: controller.onFacebookSubmit,
                                'timeStamp': DateTime.now().millisecondsSinceEpoch,
                              },
                            ),
                          ],
                          // shrinkWrap: true,
                        ),
                        Transform.translate(
                            offset: const Offset(0, -80),
                            child: Image.asset('assets/images/profile.png', width: 160, height: 160),
                          ),
                        ],
                      ),
                  ),
                  if (controller.isUpdatedInProgress.value == true)
                    Center(child: CircularProgressIndicator(color: '#CB2B93'.toColor()!,))
                ],
              );
            }).expanded(),
          ],
        ),
      ),
    );
  }
}