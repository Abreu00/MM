import 'package:flutter/material.dart';

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

  void handleSubmit() {
    if (_formKey.currentState.validate()) {
      print('valid');
    }
  }

  List<Widget> createFields() {
      List<Widget> fields = new List<Widget>();

      lista.forEach((item) {
        fields.add(
          RecordField(field: item)
        );
      });
    
      return fields;
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.unmodifiable(() sync* {
            yield* createFields();
            yield Container(
              child: RaisedButton(
              onPressed: this.handleSubmit,
              child: Text("Submit"),
              )
            );  
          }())
        ),
      )
    );
  }
}

class RecordField extends StatelessWidget {

  final String field;

  RecordField({this.field});

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