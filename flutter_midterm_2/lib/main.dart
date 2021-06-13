import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_midterm_2/logic/cubits/expense_cubit.dart';
import 'package:flutter_midterm_2/presentation/router/app_router.dart';

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
        BlocProvider<ExpenseCubit>(
          create: (context) => ExpenseCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter &  firebase',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
