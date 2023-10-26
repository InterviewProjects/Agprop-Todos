// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) => TodoItem(
      todoId: json['todoId'] as String?,
      text: json['text'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      timeStamp: json['timeStamp'] as int?,
    );

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'todoId': instance.todoId,
      'text': instance.text,
      'isCompleted': instance.isCompleted,
      'timeStamp': instance.timeStamp,
    };
