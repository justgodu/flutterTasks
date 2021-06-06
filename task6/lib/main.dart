import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/logic/cubits/planet_data/planet_data_cubit.dart';
import 'package:task6/presentation/router/app_router.dart';

import 'logic/cubits/people_data/people_data_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PeopleDataCubit>(
          create: (context) => PeopleDataCubit(),
        ),
        BlocProvider<PlanetDataCubit>(
          create: (context) => PlanetDataCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter REST API',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
