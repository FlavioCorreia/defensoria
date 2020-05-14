import 'package:flutter/material.dart';

class AtrasoPensao extends StatefulWidget {
  @override
  _AtrasoPensaoState createState() => _AtrasoPensaoState();
}

class _AtrasoPensaoState extends State<AtrasoPensao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Informar Atraso de Pensão", style: TextStyle(fontSize: 24)),
          centerTitle: true,
        ),
        body: Column(
            children: <Widget>[
              Text("xxxxxxxx", style: TextStyle(fontSize: 30)),

            ]
        )
    );;
  }
}
