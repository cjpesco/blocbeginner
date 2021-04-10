import 'package:blocbeginner/logic/cubits/cubits.dart';
import 'package:blocbeginner/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Counter Cubit Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: HomeScreen(
          title: 'Home Screen',
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
