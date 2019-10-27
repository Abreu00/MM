import 'package:flutter/material.dart';
import 'addRecord.dart';
import 'dailyReport.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  
  @override
  HomeState createState() => HomeState();
}


class HomeState extends State<Home> {
  
  List<DailyReport> _reports = List<DailyReport>();

  void fetchReports() async {
    List<DailyReport> reports = await DailyReport.reports();
    setState(() {
      _reports = reports;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mastermind"),
      ),
      body: ReportsList(reports: _reports,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddRecord()));
        },
      ),
    );
  }
}

class ReportsList extends StatelessWidget {
  final List<DailyReport> reports;

  ReportsList({this.reports});

  
  String formatFromEpoch(int sinceEpoch) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(sinceEpoch);
    List<String> yearMonthDay = date.toLocal().toString().split(' ')[0].split('-');
    String dayMonthYearFormated = yearMonthDay.reversed.join('/');

    return dayMonthYearFormated;
  
  }
  
  Widget build(BuildContext context) {

    return ListView.separated(
      itemCount: reports.length,
      padding: EdgeInsets.all(8),
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return 
        GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Center(child: Text(formatFromEpoch(reports[index].creation)) ),
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          onTap: () {
            print(index);
          },
        );
      },
    );
  }

}

