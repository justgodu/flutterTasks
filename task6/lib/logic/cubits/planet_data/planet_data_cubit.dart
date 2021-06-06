
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task6/data/models/planet.dart';
import 'package:task6/data/repositories/planet_repository.dart';
part 'planet_data_state.dart';
class PlanetDataCubit extends Cubit<PlanetDataState> {
  PlanetDataCubit() : super(PlanetDataInitial());

  final userRepo = PlanetRepository();

  Future<void> getPlanetData(String link) async {
    try {
      var planet = await userRepo.fetchPlanet(link);
      debugPrint("link: " + link);
      emit(PlanetDataLoaded(planet: planet));
    } catch (e) {
      emit(PlanetDataError(message: e.toString()));
    }
  }
}
