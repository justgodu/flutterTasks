import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_todo/data/database.dart';
import 'package:final_todo/data/models/todos.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  final database = Database();

  Future<void> getTodos() async {
    try {
      var list = await database.readTodos();
      emit(TodoDataLoaded(todoList: list));
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      await database.addTodo(todo);
      emit(TodoInitial());
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await database.updateTodo(todo);
      emit(TodoInitial());
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await database.deleteTodo(id);
      emit(TodoInitial());
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }
}
