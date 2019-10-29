import 'package:flutter/material.dart';
import 'dailyReport.dart';
import 'dart:convert';

class AddRecord extends StatefulWidget {
  
  @override
  AddRecordState createState() => AddRecordState();

}


class AddRecordState extends State<AddRecord> {
  final _formKey = GlobalKey<FormState>();

  final List<String> lista = <String>[
    "O que eu fiz de produtivo hoje?",
    "O que eu poderia ter feito para ser mais produtivo?",
    "Consegui economizar dinheiro? Quanto Gastei?",
    "Precisava ter gasto o que gastei?",
    "Como eu me senti hoje?",
    "Uma nota para o dia de hoje?",
    "Fui melhor que ontem?",
    "Sou grato por...",
  ];
  final List<TextEditingController> inputs = <TextEditingController>[
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController()
  ];

  void handleSubmit() {
    if (_formKey.currentState.validate()) {    
      
      List<String> content = inputs.map((controller) => controller.text).toList();
      DailyReport report = new DailyReport(content: json.encode(content));
      
      report.insertReport();
      Navigator.pop(context, report);
    }
  }

  List<Widget> createFields() {
      List<Widget> fields = new List<Widget>();

      for (int i = 0; i < lista.length; ++i) {
        fields.add(
          RecordField(field: lista[i], controller: inputs[i])
        );
      }
      return fields;
  }

  @override
  Widget build(BuildContext context) {
    
    Widget form = Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.unmodifiable(() sync* {
            yield* createFields();
            yield Container(
              child: RaisedButton(
              onPressed: this.handleSubmit,
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
              ),
            );  
          }())
        ),
      )
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo dia'),
        centerTitle: false,
      ),
      body: form
    
    );
    
  }
}

class RecordField extends StatelessWidget {

  final String field;
  final TextEditingController controller;

  RecordField({this.field, this.controller});

  String validator(value) {
    if (value.isEmpty) {
      return "Preencha esse texto";
    }
    return null;
  }

  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        Container(
          child: Text(this.field,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
          child: TextFormField(
            validator: this.validator,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: this.controller,
            decoration: new InputDecoration(
              filled: true,
              fillColor: Theme.of(context).primaryColor,
            ),            
          ),
        )
      ]
    );
  }
}