import 'package:flutter/material.dart';

class Contate extends StatefulWidget {
  @override
  _ContateState createState() => _ContateState();
}

Color temaVerde = Color.fromRGBO(66, 192, 177, 1);
class _ContateState extends State<Contate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contate-nos", style: TextStyle(fontSize: 24)),
          centerTitle: true,
          backgroundColor: temaVerde,
        ),
        body: Column(
            children: <Widget>[
              Text("xxxxxxxx", style: TextStyle(fontSize: 30)),

            ]
        )
    );
  }
}
