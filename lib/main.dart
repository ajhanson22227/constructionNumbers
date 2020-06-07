import 'package:flutter/material.dart';
import 'package:construction/screens/firstScreen.dart';
import 'package:construction/screens/secondScreen.dart';
void main() {
  runApp(MaterialApp(
    title: 'Construction Estimates',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => StartScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/roadconstruct': (context) => RoadConstruction(),
    },
  ));
}
