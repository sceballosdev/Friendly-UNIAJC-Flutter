// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) {
  return TaskEntity(
      task: json['task'] as String,
      taskvalue: (json['taskvalue'] as num)?.toDouble(),
      colorval: json['colorval']);
}

Map<String, dynamic> _$TaskEntityToJson(TaskEntity instance) =>
    <String, dynamic>{
      'task': instance.task,
      'taskvalue': instance.taskvalue,
      'colorval': instance.colorval
    };
