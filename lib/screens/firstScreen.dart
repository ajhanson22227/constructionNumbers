import 'package:flutter/material.dart';



class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose an Option'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('New Road Construction / Alley'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/roadconstruct');
          },
        ),
      ),
    );
  }
}

