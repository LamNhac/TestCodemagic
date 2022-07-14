import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/counter_cubit.dart';
import 'package:myapp/presentation/screens/HomeScreen.dart';
import 'package:myapp/presentation/screens/SecondScreen.dart';
import 'package:myapp/presentation/screens/ThirdScreen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(title: "HomeScreen"));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(title: "SecondScreen"));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(title: "ThirdScreen"));

      default:
        return null;
    }
  }
  void dispose(){
    _counterCubit.close();
}
}

