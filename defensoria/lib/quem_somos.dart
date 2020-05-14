import 'package:flutter/material.dart';

class QuemSomos extends StatefulWidget {
  @override
  _QuemSomosState createState() => _QuemSomosState();
}

class _QuemSomosState extends State<QuemSomos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quem Somos", style: TextStyle(fontSize: 24)),
          centerTitle: true,
        ),
      body: Column(
        children: <Widget>[
          Text("xxxxxxxx", style: TextStyle(fontSize: 30)),

        ]
      )
    );
  }
}
