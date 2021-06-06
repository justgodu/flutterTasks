import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/logic/cubits/people_data/people_data_cubit.dart';
import 'package:task6/logic/cubits/planet_data/planet_data_cubit.dart';

class PeopleDetailsScreen extends StatelessWidget {
  const PeopleDetailsScreen({Key key, this.planetLink}) : super(key: key);
  final String planetLink;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Planet"),
      ),
      body: BlocConsumer<PlanetDataCubit, PlanetDataState>(
          listener: (context, state) {
            if (state is PlanetDataError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${state.message}')),
              );
            }
          }, builder: (context, state) {
        if (state is PlanetDataInitial) {
          BlocProvider.of<PlanetDataCubit>(context).getPlanetData(planetLink);
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PlanetDataLoaded) {

          return Center(
            child: Column(
              children: [
                Text("Name: " + state.planet.name),
                Text("Gravity: " + state.planet.gravity),
                Text("Popultaion: " + state.planet.population)
              ],
            ),
          );
        }
        else {
          return Center(
            child: Text('Ops! Something went wrong!'),
          );
        }
      }),
    );
  }
}
