import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  final String reportDate;
  final List<dynamic> content;

  ReportView({this.reportDate, this.content});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(reportDate),),
      body: Column(
        children: <Widget>[
          Container(height: MediaQuery.of(context).size.height * 0.10, child: Center(child: Text(content[0])),),
          Container(height: MediaQuery.of(context).size.height * 0.10,child: Center(child: Text(content[1])),),
          Container(height: MediaQuery.of(context).size.height * 0.10, child: Center(child: Text(content[2])),),
          Container(height: MediaQuery.of(context).size.height * 0.10, child: Center(child: Text(content[3])),),
          Container(height: MediaQuery.of(context).size.height * 0.10, child: Center(child: Text(content[4])),),
          Container(height: MediaQuery.of(context).size.height * 0.10, child: Center(child: Text(content[5])),),
          Container(height: MediaQuery.of(context).size.height * 0.10, child: Center(child: Text(content[6])),),
          Container(height: MediaQuery.of(context).size.height * 0.10, child: Center(child: Text(content[7])),),

        ],
       ),
    );
  }
}
