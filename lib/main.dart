import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'fahrenheit_celcius_calculator.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: FahrenheitCelciusCalculator());
  }
}
