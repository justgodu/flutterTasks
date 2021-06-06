import 'package:flutter/material.dart';
import 'package:task6/presentation/screens/home_screen.dart';
import 'package:task6/presentation/screens/people_details_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (settings.name == '/people-details') {
      var planetLink = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => PeopleDetailsScreen(planetLink: planetLink));
    }
  }
}
