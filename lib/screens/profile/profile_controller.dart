import 'package:domain_package/entities/profile/profile_item.dart';
import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:flutter_base/screens/authentication/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileController extends BaseController {
  ProfileController({required super.params}): super();

  final Rx<ProfileItem> profileItem = const ProfileItem().obs;
  final Rx<bool> isUpdatedInProgress = false.obs;

  @override
  void onInit() {
    super.onInit();

    _onReady();
  }

  void _onReady() async {
    isUpdatedInProgress.value = true;
    profileItem.value = await profileUseCase.fetchProfileItem();
    isUpdatedInProgress.value = false;
  }

  void onNameSubmit(String value) {
    if (value.isNullEmptyOrWhitespace == true) return;

    final item = profileItem.value.copyWith(name: value);
    profileUseCase.insertProfileItem(profileItem: item);

    profileItem.value = item;
  }

  void onGenderSubmit(String value) {
    if (value.isNullEmptyOrWhitespace == true) return;

    final item = profileItem.value.copyWith(gender: value);
    profileUseCase.insertProfileItem(profileItem: item);

    profileItem.value = item;
  }

  void onCitySubmit(String value) {
    if (value.isNullEmptyOrWhitespace == true) return;

    final item = profileItem.value.copyWith(city: value);
    profileUseCase.insertProfileItem(profileItem: item);

    profileItem.value = item;
  }

  void onPinCodeSubmit(String value) {
    if (value.isNullEmptyOrWhitespace == true) return;

    final item = profileItem.value.copyWith(pinCode: value);
    profileUseCase.insertProfileItem(profileItem: item);

    profileItem.value = item;
  }

  void onLinkedinSubmit(String value) {
    if (value.isNullEmptyOrWhitespace == true) return;

    final item = profileItem.value.copyWith(linkedin: value);
    profileUseCase.insertProfileItem(profileItem: item);

    profileItem.value = item;
  }

  void onFacebookSubmit(String value) {
    if (value.isNullEmptyOrWhitespace == true) return;

    final item = profileItem.value.copyWith(facebook: value);
    profileUseCase.insertProfileItem(profileItem: item);

    profileItem.value = item;
  }

  void onBackTap() {
    Navigator.pop(Get.context!);
  }

  void onLogoutTap() {
    Get.defaultDialog(
      title: 'Do you want to logout?',
      titleStyle: GoogleFonts.novaFlat(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.purple,
      ),
      titlePadding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      middleText: '',
      textConfirm: 'Yes',
      textCancel: 'No',
      buttonColor: Colors.purple,
      onConfirm: () async {
        await profileUseCase.clear();
        Navigator.pushAndRemoveUntil(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => SignInPage(
              widgetKey: const ValueKey('SignInPage'),
              params: { 'timeStamp': DateTime.now().millisecondsSinceEpoch },
            ),
          ),
              (Route<dynamic> route) => false,
        );
      },
      onCancel: () {

      }
    );
    return;
  }
}