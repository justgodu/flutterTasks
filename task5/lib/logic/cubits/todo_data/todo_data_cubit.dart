import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rest_api_example/data/models/todo.dart';
import 'package:flutter_rest_api_example/data/repositories/todo_repository.dart';

part 'todo_data_state.dart';

class TodoDataCubit extends Cubit<TodoDataState> {
  TodoDataCubit() : super(TodoDataInitial());


  final todoRepo = TodoRepository();

  Future<void> getTodoData(String userID) async {
    try {
      var list = await todoRepo.fetchTodoByUserID(userID);
      emit(TodoDataLoaded(todoList: list!));
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }

  Future<void> postTodoData(String userID ,Todo todo) async {
    try {
      await todoRepo.postTodoByUserID(userID,todo);
      var list = await todoRepo.fetchTodoByUserID(userID);
      emit(TodoDataLoaded(todoList: list!));
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }

  Future<void> deleteTodo(int? ID, String userID) async {
    try {
      await todoRepo.deleteTodoById(userID, ID.toString());
      var list = await todoRepo.fetchTodoByUserID(userID);
      emit(TodoDataLoaded(todoList: list!));
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }
}
