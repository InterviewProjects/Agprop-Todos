import 'package:domain_package/entities/todo/todo_item.dart';
import 'package:domain_package/repositories/local_storage_repository.dart';
import 'package:domain_package/repositories/todos_repository.dart';

class TodosUseCase {
  final TodosRepository _repository;
  final LocalStorageRepository _localStorageRepository;
  TodosUseCase(this._repository, this._localStorageRepository);

  Stream<List<TodoItem>> fetchTodoItemsStream() =>
      _repository.fetchTodoItemsStream(userId: _localStorageRepository.getUserId());

  Future<List<TodoItem>> fetchTodoItems() =>
      _repository.fetchTodoItems(userId: _localStorageRepository.getUserId());

  Future<void> insertNewTodoItem({required TodoItem todoItem}) =>
      _repository.insertNewTodoItem(todoItem: todoItem, userId: _localStorageRepository.getUserId());

  Future<void> changeTodoItemStatus({required TodoItem todoItem}) =>
      _repository.changeTodoItemStatus(todoItem: todoItem, userId: _localStorageRepository.getUserId());

  Future<void> deleteTodoItem({required TodoItem todoItem}) =>
      _repository.deleteTodoItem(todoItem: todoItem, userId: _localStorageRepository.getUserId());
}