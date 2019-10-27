import 'package:flutter/material.dart';
import 'addRecord.dart';
import 'dailyReport.dart';

class Home extends StatelessWidget {
  

  Future<String> getText() async {
    List<DailyReport> reports = await DailyReport.reports();
    
    return reports[reports.length -1].content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mastermind"),
      ),
      body: Center(child: Text("aa")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddRecord()));
        },
      ),
    );
  }
}