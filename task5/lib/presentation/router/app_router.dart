import 'package:flutter/material.dart';
import 'package:flutter_rest_api_example/presentation/screens/home_screen.dart';
import 'package:flutter_rest_api_example/presentation/screens/post_todo_screen.dart';
import 'package:flutter_rest_api_example/presentation/screens/todo_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (settings.name == '/todo-screen') {
      var userID = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => TodoScreen(userID: userID));
    }else if(settings.name == '/add-todo'){
      return MaterialPageRoute(builder: (_) => PostTodoScreen());
    } else {
      return null;
    }
  }
}
