import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:flutter_base/core/widgets/base_reactive_section_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTextField extends BaseReactiveSectionWidget<ProfileTextFieldController> {
  const ProfileTextField({required super.widgetKey, required super.params}): super();

  @override
  ProfileTextFieldController createController() => ProfileTextFieldController(params: params);

  @override
  Widget buildView(BuildContext context) {
    super.buildView(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Obx(() {
        // if (controller.isFocused.value == true) return SizedBox.shrink();
        return TextField(
          controller: controller.textController,
          cursorColor: Colors.purple,
          style: GoogleFonts.novaFlat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: controller.isFocused.value ? Colors.purple : Colors.grey.shade900,
          ),
          focusNode: controller.focusNode,
          decoration: InputDecoration(
            isDense: true,
            hintText: controller.hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade400,
            ),
            counter: const Offstage(),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            // border: InputBorder.none,
            // focusedBorder: const OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
            //   borderSide: BorderSide(color: Colors.purple),
            // ),
            // enabledBorder: const OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
            //   borderSide: BorderSide(color: Colors.grey),
            // ),
            // errorBorder: InputBorder.none,
            // disabledBorder: const OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
            //   borderSide: BorderSide(color: Colors.grey, width: 0),
            // ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            // filled: true,
            // fillColor: Colors.grey.shade50,
          ),
          keyboardType: controller.textInputType,
          textCapitalization: TextCapitalization.words,
          enableSuggestions: false,
          autocorrect: false,
          enabled: controller.isEnabled,
          minLines: 1,
          maxLines: 1,
          maxLength: controller.maxLength,
          onSubmitted: (value) {
            controller.onSubmit?.call(value);
          },
          onTap: () {
            controller.onTap();
          },
        );
      }),
    );
  }
}

class ProfileTextFieldController extends BaseController {
  ProfileTextFieldController({required super.params}): super();

  late TextEditingController textController;
  late FocusNode focusNode;
  late bool isEnabled;
  late String hintText;
  late TextInputType? textInputType;
  late int? maxLength;
  late Function(String value)? onSubmit;

  final isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();

    isEnabled = params[defaultEnabledKey] ?? true;
    hintText = params[defaultHintKey] ?? '';
    textInputType = params[defaultKeyboardTypeKey];
    maxLength = params[defaultMaxLengthKey];
    onSubmit = params[onSubmitKey];

    textController = TextEditingController(text: params[defaultTextKey] ?? '');
    focusNode = FocusNode();
    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
    });
  }

  void onTap() {
    FocusScope.of(Get.context!).requestFocus(focusNode);
  }

  static String defaultTextKey = 'defaultTextKey';
  static String defaultEnabledKey = 'defaultEnabledKey';
  static String defaultHintKey = 'defaultHintKey';
  static String defaultKeyboardTypeKey = 'defaultKeyboardTypeKey';
  static String defaultMaxLengthKey = 'defaultMaxLengthKey';
  static String onSubmitKey = 'onSubmitKey';
}