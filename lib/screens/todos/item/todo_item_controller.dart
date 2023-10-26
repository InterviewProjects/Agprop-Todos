import 'package:domain_package/entities/todo/todo_item.dart';
import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:get/get.dart';

class TodoItemController extends BaseController {
  TodoItemController({required super.params}): super();

  final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _onInit();
  }

  void onDone() => _onDone();

  void _onInit() {
    final item = params['todoItem'] as TodoItem?;
    textController.text = item?.text ?? '';
  }

  void _onDone() async {
    final text = textController.text;
    if (text.isNullEmptyOrWhitespace == false) {
      TodoItem? item = params['todoItem'] as TodoItem?;
      if (item == null) {
        final timeStamp = DateTime.now().millisecondsSinceEpoch;
        item = TodoItem(todoId: '$timeStamp', text: text, isCompleted: false, timeStamp: timeStamp);
      } else {
        item = item.copyWith(text: text);
      }
      todosUseCase.insertNewTodoItem(todoItem: item);
    }

    await Future.delayed(const Duration(milliseconds: 200));
    Navigator.pop(Get.context!, [true]);
  }
}