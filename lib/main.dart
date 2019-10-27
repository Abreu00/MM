import 'package:flutter/material.dart';

import 'home.dart';

void main() async {
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: "Mastermind",
      home: Home(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[800],
      ),
    );
  }
}