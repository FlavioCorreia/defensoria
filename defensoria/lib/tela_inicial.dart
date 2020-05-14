import 'package:flutter/material.dart';
import 'package:defensoria/formulario.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Defensoria Publica", style: TextStyle(fontSize: 24)),
          centerTitle: true,
        ),
        body: Column(

          children: <Widget>[
            RaisedButton(
              child: Text("Solicitar Pensão", style: TextStyle(fontSize: 30)),
            ),
            RaisedButton(
              child: Text("Informar Pensão em Atraso", style: TextStyle(fontSize: 30)),),
            RaisedButton(
              child: Text("Contate-nos", style: TextStyle(fontSize: 30)),),
            RaisedButton(
              child: Text("Sobre", style: TextStyle(fontSize: 30)),)
          ]
        )
    );
  }
}
