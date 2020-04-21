import 'package:flutter/material.dart';
import 'package:defensoria/formulario.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      home: Formulario(),
      debugShowCheckedModeBanner: false,
    );
  }
}
