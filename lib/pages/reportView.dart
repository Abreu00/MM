import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  final String reportDate;
  final List<dynamic> content;

  ReportView({this.reportDate, this.content});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(reportDate)),
      body: ListView(
        children: List.generate(content.length, (int index) {
           return ListRow(
            child: Row(
              children: <Widget>[
                NumberIcon(num: index + 1), 
                Expanded( child: Text(
                  content[index].toString(), 
                  style: TextStyle(fontSize: 20), 
                  textAlign: TextAlign.left)
                )
              ]
            )
          );
        })),
       );
  }
}

class ListRow extends StatelessWidget {
  final Widget child;
  ListRow({this.child});

   Widget build(BuildContext context) {
     return Container(
       child: this.child,
       padding: EdgeInsets.all(8),
       margin: EdgeInsets.all(5),
       decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.all(
          Radius.circular(5)
        )
      ),
     );
   }
}

class NumberIcon extends StatelessWidget {
  final int num;

  NumberIcon({this.num});

  Widget build(BuildContext context) {
    return Container( 
      padding: EdgeInsets.all(10), 
      child: 
      Center(child: Text(num.toString(), style: TextStyle(fontSize: 24))),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        )
      ),
      );
  }
}