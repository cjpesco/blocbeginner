import 'package:blocbeginner/logic/cubits/cubits.dart';
import 'package:blocbeginner/presentation/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(title: 'Home', color: Colors.blueAccent)));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(title: 'Second', color: Colors.redAccent)));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child:
                    ThirdScreen(title: 'Third', color: Colors.purpleAccent)));
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }

  void dispose() {
    _counterCubit.close();
  }
}
