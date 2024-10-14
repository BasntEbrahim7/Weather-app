import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/presentation/screens/home.dart';

import 'business_logic/weather_cubit.dart';
import 'data/repo/weather_repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepository()),
        child: WeatherSearchScreen(),
      ),
    );
  }
}
