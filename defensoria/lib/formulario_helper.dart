import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormularioHelper{
  static final FormularioHelper _instance = FormularioHelper.internal(); //SINGLETOON
  factory FormularioHelper() => _instance;  //SINGLETOON
  FormularioHelper.internal();  //SINGLETOON

  Color temaVerde = Color.fromRGBO(66, 192, 177, 1);
  List<String> _listaNomes = List();

  Widget buildTextField(String label, String prefix, TextEditingController c, TextInputType tit, bool validator, {Function f}){
    return TextField(
      controller: c,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        prefixText: prefix,
        enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: temaVerde)),
        focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.orange)),
        errorText: !validator ? "Informe uma entrada válida" : null,
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      onChanged: f,
      keyboardType: tit,
    );
  }

  //PASSANDO A MÁSCARA
  Widget buildTextFieldM(String label, String prefix, TextEditingController c, TextInputType tit, bool validator, {MaskTextInputFormatter mask, Function f}){
    return TextField(
      scrollPadding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      controller: c,
      inputFormatters: [mask],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        prefixText: prefix,
        enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: temaVerde)),
        focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.orange)),
        errorText: !validator ? "Informe uma entrada válida" : null,
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      onChanged: f,
      keyboardType: tit,
    );
  }

}