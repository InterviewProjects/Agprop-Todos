import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'todo_item.g.dart';

@CopyWith()
@JsonSerializable()
class TodoItem extends Equatable {
  final String? todoId;
  final String? text;
  final bool? isCompleted;
  final int? timeStamp;

  const TodoItem({
    this.todoId,
    this.text,
    this.isCompleted,
    this.timeStamp,
  });

  factory TodoItem.fromJson(Map<dynamic, dynamic> json) => TodoItem(
    todoId: json['todoId'] as String?,
    text: json['text'] as String?,
    isCompleted: json['isCompleted'] as bool?,
    timeStamp: json['timeStamp'] as int?
  );

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);

  @override
  List<Object?> get props => [todoId, text, isCompleted, timeStamp];
}

extension TodoItemExtension on TodoItem {
  TodoItem copyWith({String? todoId, String? text, bool? isCompleted, int? timeStamp}) {
    return TodoItem(
      todoId: todoId ?? this.todoId,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }
}

int comparator(TodoItem a, TodoItem b) {
  if (a.isCompleted == true && !(b.isCompleted == true)) {
    return 1;
  } else if (b.isCompleted == true && !(a.isCompleted == true)){
    return -1;
  } else {
    if (a.timeStamp! < b.timeStamp!) {
      return -1;
    } else if (a.timeStamp! > b.timeStamp!) {
      return 1;
    } else {
      return 0;
    }
  }
}