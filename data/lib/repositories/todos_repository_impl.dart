import 'dart:async';

import 'package:domain_package/entities/todo/todo_item.dart';
import 'package:domain_package/repositories/todos_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class TodosRepositoryImpl extends TodosRepository {
  final FirebaseDatabase _database;

  TodosRepositoryImpl(this._database,);

  @override
  Stream<List<TodoItem>> fetchTodoItemsStream({required String userId}) {
    final ref = _database.ref('todos/$userId');
    final stream = ref.get().asStream();
    final returnValue = stream.transform<List<TodoItem>>(StreamTransformer.fromHandlers(handleData: (snapshot, EventSink sink) {
      final todosMap = snapshot.value as Map<dynamic, dynamic>;
      final todoItems = todosMap.values.toList().map((e) => TodoItem.fromJson(e as Map<dynamic, dynamic>)).toList();
      sink.add(todoItems);
    }));
    return returnValue;
  }

  @override
  Future<List<TodoItem>> fetchTodoItems({required String userId}) async {
    final ref = _database.ref('todos/$userId');
    DataSnapshot snapshot = await ref.get();
    final todosMap = snapshot.value as Map<dynamic, dynamic>;
    final todoItems = todosMap.values.toList().map((e) => TodoItem.fromJson(e as Map<dynamic, dynamic>)).toList();
    return Future.value(todoItems);
  }

  @override
  Future<void> insertNewTodoItem({required TodoItem todoItem, required String userId}) async {
    final ref = _database.ref('todos/$userId/${todoItem.todoId}');
    await ref.set(todoItem.toJson());
    return Future.value();
  }

  @override
  Future<void> changeTodoItemStatus({required TodoItem todoItem, required String userId}) async {
    final ref = _database.ref('todos/$userId/${todoItem.todoId}');
    await ref.update({'isCompleted': todoItem.isCompleted});
    return Future.value();
  }

  @override
  Future<void> deleteTodoItem({required TodoItem todoItem, required String userId}) async {
    final ref = _database.ref('todos/$userId/${todoItem.todoId}');
    await ref.remove();
    return Future.value();
  }

}