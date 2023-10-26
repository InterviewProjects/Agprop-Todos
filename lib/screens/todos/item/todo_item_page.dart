import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/core_ui_extension.dart';
import 'package:flutter_base/core/widgets/base_reactive_screen_widget.dart';
import 'package:flutter_base/screens/todos/item/todo_item_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoItemPage extends BaseReactiveScreenWidget<TodoItemController> {
  TodoItemPage({required super.widgetKey, required super.params}): super();

  @override
  TodoItemController createController() => TodoItemController(params: params);

  @override
  Widget buildView(BuildContext context) {
    super.buildView(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ["#CB2B93".toColor()!, "#9546C4".toColor()!, "#5E61F4".toColor()!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  controller: controller.textController,
                  cursorColor: Colors.white,
                  style: GoogleFonts.novaFlat(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Start typing to add your todo...',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    counter: const Offstage(),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 15, bottom: 11, top: 50, right: 15),
                  ),
                  keyboardType: TextInputType.text,
                  enableSuggestions: false,
                  autocorrect: false,
                  minLines: 6,
                  maxLines: 10,
                  onSubmitted: (value) {
                    controller.onDone();
                  },
                  autofocus: true,
                ).expanded()
              ],
            )
          ],
        ),
      ),
    );
  }
}