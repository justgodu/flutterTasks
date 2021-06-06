import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:task6/data/models/planet.dart';
class PlanetRepository {
  Planet planet  = new Planet();
  Dio dio = Dio();

  Future<Planet> fetchPlanet(String link) async {
    final response = await Dio().get(link);

    if (response.statusCode == 200) {
      planet = Planet.fromJson(response.data);
      return planet;
    }
    return planet;
  }
}