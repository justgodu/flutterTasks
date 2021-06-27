import 'package:final_todo/logic/cubits/todo_cubit.dart';
import 'package:final_todo/presentation/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (context) => TodoCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter &  firebase',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
