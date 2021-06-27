part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  TodoState([List props = const []]);
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoDataLoaded extends TodoState{
  final List<Todo> todoList;

  TodoDataLoaded({this.todoList});

  @override
  List<Object> get props => [todoList];
}

class TodoDataError extends TodoState{
  final String message;

  TodoDataError({this.message});

  @override
  List<Object> get props => [message];
}