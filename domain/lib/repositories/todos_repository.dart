import 'package:domain_package/entities/todo/todo_item.dart';

abstract class TodosRepository {
  Stream<List<TodoItem>> fetchTodoItemsStream({required String userId});
  Future<List<TodoItem>> fetchTodoItems({required String userId});
  Future<void> insertNewTodoItem({required TodoItem todoItem, required String userId});
  Future<void> changeTodoItemStatus({required TodoItem todoItem, required String userId});
  Future<void> deleteTodoItem({required TodoItem todoItem, required String userId});
}