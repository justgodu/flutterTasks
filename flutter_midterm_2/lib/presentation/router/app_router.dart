import 'package:flutter/material.dart';
import 'package:flutter_midterm_2/presentation/screens/home.dart';
import 'package:flutter_midterm_2/presentation/screens/login.dart';
import 'package:flutter_midterm_2/presentation/screens/add_expense.dart';
import 'package:flutter_midterm_2/presentation/screens/edit_expense.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => Login());
    }else if (settings.name == '/home') {
      return MaterialPageRoute(builder: (_) => Home());
    }else if(settings.name == "/add-expense"){
      return MaterialPageRoute(builder: (_)=> AddExpense());
    }else if(settings.name == "/edit-expense"){
      return MaterialPageRoute(builder: (_)=> EditExpense(), settings: settings);
    }
  }
}
