import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Todo extends Equatable {
  String id;
  String title;
  String todoTask;
  String todoDescription;
  bool isCompleted = false;
  Todo(
      {this.id, this.title, this.todoTask, this.todoDescription, this.isCompleted});

  factory Todo.fromJson(Map<String, dynamic> json, String id) {
    return Todo(
    id: id,
    title:  json['title'],
    todoTask: json['todoTask'],
    todoDescription: json['todoDescription'],
    isCompleted: json['isCompleted']);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['todoTask'] = this.todoTask;
    data['todoDescription'] = this.todoDescription;
    data['isCompleted'] = this.isCompleted;
    return data;
  }

  @override
  List<Object> get props => [this.id];
}