import 'dart:core';

import 'package:domain_package/entities/todo/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:flutter_base/screens/profile/profile_page.dart';
import 'package:flutter_base/screens/todos/item/todo_item_page.dart';
import 'package:get/get.dart';

class TodosController extends BaseController {
  TodosController({required super.params});

  RxList<TodoItem> todoList = [const TodoItem()].obs;

  @override
  void onInit() {
    super.onInit();

    todoList.clear();
    _onReady();
  }

  void _onReady() async {
    // final stream = todosUseCase.fetchTodoItemsStream();
    // stream.listen((list) {
    //   todoList.value = list;
    // });

    List<TodoItem> list = await todosUseCase.fetchTodoItems();
    list.sort(comparator);

    todoList.value = list;
  }

  void onProfileTap() => _onProfileTap();

  void onPlusTap() => _onPlusTap();

  void onTodoItemTap(TodoItem item) => _onTodoItemTap(item);

  void onTodoItemRadioTap(TodoItem item) => _onTodoItemRadioTap(item);

  void onTodoItemDeleteTap(TodoItem item) => _onTodoItemDeleteTap(item);


  void _onProfileTap() {
    _redirectToProfilePage();
  }

  void _onPlusTap() {
    _redirectToTodoItemPage();
  }

  void _onTodoItemTap(TodoItem item) {
    _redirectToTodoItemPage(todoItem: item);
  }

  void _onTodoItemRadioTap(TodoItem todoItem) async {
    final todoItemCopy = todoItem.copyWith(isCompleted: !(todoItem.isCompleted == true));
    todosUseCase.changeTodoItemStatus(todoItem: todoItemCopy);

    final list = todoList.toList();
    final index = list.toList().indexWhere((element) => element.todoId == todoItem.todoId);
    list[index] = todoItemCopy;
    list.sort(comparator);

    todoList.value = list;
  }

  void _onTodoItemDeleteTap(TodoItem todoItem) async {
    todosUseCase.deleteTodoItem(todoItem: todoItem);

    final list = todoList.toList();
    final index = list.toList().indexWhere((element) => element.todoId == todoItem.todoId);
    list.removeAt(index);
    list.sort(comparator);

    todoList.value = list;
  }

  void _redirectToTodoItemPage({TodoItem? todoItem}) async {
    final returnValue = await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => TodoItemPage(
          widgetKey: const ValueKey('TodoItemPage'),
          params: { ...params, 'todoItem': todoItem, 'timeStamp': DateTime.now().millisecondsSinceEpoch},
        ),
      ),
    );
    if (returnValue != null) {
      await Future.delayed(const Duration(milliseconds: 400));
      _onReady();
    }
  }

  void _redirectToProfilePage() async {
    await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          widgetKey: const ValueKey('ProfilePage'),
          params: { ...params, 'timeStamp': DateTime.now().millisecondsSinceEpoch},
        ),
      ),
    );
  }
}