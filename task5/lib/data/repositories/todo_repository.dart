

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_rest_api_example/data/models/todo.dart';

class TodoRepository {
  List<Todo>? todoList = [];
  Dio dio = Dio();

  Future<List<Todo>>? fetchTodoByUserID(String userID) async {
    var response = await dio.get('https://jsonplaceholder.typicode.com/users/$userID/todos');
    if (response.statusCode == 200) {
      var loadedTodos = <Todo>[];
      response.data.forEach((todo) {
        var todoModel = Todo.fromJson(todo);
        loadedTodos.add(todoModel);
        todoList = loadedTodos;
        return todoList!;
      });
    }
    return todoList!;
  }


  Future<Todo>? postTodoByUserID(String userID, Todo todo) async {
    final response = await dio.post('https://jsonplaceholder.typicode.com/users/$userID/todos', data: todo.toJson());

    if(response.statusCode == 200 || response.statusCode == 201){

      Todo todo = new Todo.fromJson(response.data);
      return  todo;
    }


    return todo;
  }

  Future<bool>? deleteTodoById(String userID, String todoID) async {
    final response = await dio.delete('https://jsonplaceholder.typicode.com/todos/$todoID');
    if(response.statusCode == 200 || response.statusCode == 201){

      Todo todo = new Todo.fromJson(response.data);
      return  true;
    }


    return false;
  }
}