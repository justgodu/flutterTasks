import 'package:final_todo/presentation/screens/home.dart';
import 'package:final_todo/presentation/screens/login.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => Login());
    }else if (settings.name == '/home') {
      return MaterialPageRoute(builder: (_) => Home());
    }
  }
}