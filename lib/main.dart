import 'package:blocbeginner/logic/cubits/cubits.dart';
import 'package:blocbeginner/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;
  final Connectivity _connectivity;

  const MyApp({
    @required AppRouter appRouter,
    @required Connectivity connectivity,
  })  : _appRouter = appRouter,
        _connectivity = connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: _connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) =>
              CounterCubit(internetCubit: context.read<InternetCubit>()),
        ),
      ],
      child: MaterialApp(
        title: 'Counter Cubit Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
