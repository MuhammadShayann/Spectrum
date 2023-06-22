import 'package:flutter/material.dart';
import 'weather.dart';
import 'WeatherApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherApp(),
    );
  }

  weather() {}
}
