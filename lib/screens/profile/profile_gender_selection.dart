import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:flutter_base/core/widgets/base_reactive_section_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileGenderSelection extends BaseReactiveSectionWidget<ProfileGenderSelectionController> {
  const ProfileGenderSelection({required super.widgetKey, required super.params}): super();

  @override
  ProfileGenderSelectionController createController() => ProfileGenderSelectionController(params: params);

  @override
  Widget buildView(BuildContext context) {
    super.buildView(context);

    return Obx(() {
      return Row(
        children: [
          Radio(
            value: 'Male',
            groupValue: controller.selectedText.value,
            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              return ('Male' == controller.selectedText.value) ? Colors.purple : Colors.grey.shade600;
            }),
            onChanged: (value) {
              controller.onTap('Male');
            },
          ),
          Text(
            'Male',
            style: GoogleFonts.novaFlat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: 'Male' == controller.selectedText.value ? Colors.purple : Colors.grey.shade500,
            ),
          ),
          Radio(
            value: 'Female',
            groupValue: controller.selectedText.value,
            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              return ('Female' == controller.selectedText.value) ? Colors.purple : Colors.grey.shade600;
            }),
            onChanged: (value) {
              controller.onTap('Female');
            },
          ),
          Text(
            'Female',
            style: GoogleFonts.novaFlat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: 'Female' == controller.selectedText.value ? Colors.purple : Colors.grey.shade500,
            ),
          ),
        ],
      );
    });
  }
}

class ProfileGenderSelectionController extends BaseController {
  ProfileGenderSelectionController({required super.params}): super();

  final Rx<String> selectedText = ''.obs;
  late Function(String value)? onSubmit;

  @override
  void onInit() {
    super.onInit();

    onSubmit = params[onSubmitKey];

    selectedText.value = params[selectedTextKey] ?? '';
  }

  void onTap(String value) {
    selectedText.value = value;
    onSubmit?.call(value);
  }

  static String selectedTextKey = 'selectedTextKey';
  static String onSubmitKey = 'onSubmitKey';
}