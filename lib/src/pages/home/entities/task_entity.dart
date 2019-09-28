import 'package:flutter/painting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_entity.g.dart';

@JsonSerializable()
class TaskEntity {

  TaskEntity({this.task, this.taskvalue, this.colorval});

  String task;
  double taskvalue;
  Color colorval;

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);

}