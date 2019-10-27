import 'package:flutter/material.dart';
import 'addRecord.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: "Mastermind",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mastermind"),
        ),
        body: AddRecord()
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[800],
      ),
    );
  }
}