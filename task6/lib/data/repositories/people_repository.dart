import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task6/data/models/people.dart';
class PeopleRepository {
  List<People> userList = [];
  Dio dio = Dio();

  Future<List<People>> fetchPeople() async {
    final response = await Dio().get('https://swapi.dev/api/people/');

    if (response.statusCode == 200) {
      var loadedPeople = <People>[];
      var results = response.data['results'];

      results.forEach((people) {
        var peopleModel = People.fromJson(people);
        loadedPeople.add(peopleModel);
        userList = loadedPeople;
        return userList;
      });
    }
    return userList;
  }
}