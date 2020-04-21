import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //CONTROLADORES
  final cNomeMae = new TextEditingController();
  final cCPFMae = new TextEditingController();
  final cFoneMae = new TextEditingController();
  final cNomePai = new TextEditingController();
  final cCPFPai = new TextEditingController();
  final cEnderecoPai = new TextEditingController();
  final cNomeCrianca = new TextEditingController();
  final cCPFCrianca = new TextEditingController();
  final cDataCrianca = new TextEditingController();

  //MASCARAS pubspec => mask_text_input_formatter: ^1.0.6
  final maskFone = new MaskTextInputFormatter(mask: '(##) # ####-####', filter: { "#": RegExp(r'[0-9]') });
  final maskCPFMae = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  final maskCPFPai = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  final maskCPFFilho = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  final maskData = new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });

  //CORES
  static const Color colorPrimary = Color.fromARGB(255, 51, 51, 51); //EXEMPLO COR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Formulario De Solicitação",
            style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            buildTextField("Nome Da Mãe", "Nome: ", cNomeMae, TextInputType.text),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF Da Mãe", "CPF: ", cCPFMae, TextInputType.number, mask: maskCPFMae),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("Contato Da Mãe", "Telefone: ", cFoneMae, TextInputType.phone, mask: maskFone),

            Divider(height: 35, color: Colors.blue),
            buildTextField("Nome Do Pai", "Nome: ", cNomePai, TextInputType.text),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF Do Pai", "CPF: ", cCPFPai, TextInputType.number, mask: maskCPFPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Endereço Do Pai", "End.: ", cEnderecoPai, TextInputType.text),

            Divider(height: 35, color: Colors.blue),
            buildTextField("Nome Da Criança", "Nome: ", cNomeCrianca, TextInputType.text),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF Da Criança", "CPF: ", cCPFCrianca, TextInputType.number, mask: maskCPFFilho),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("Nascimento Da Criança", "Data: ", cDataCrianca, TextInputType.datetime, mask: maskData),
          ],
        )
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c, TextInputType tit, {Function f}){
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(),
      prefixText: prefix,
      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.blue)),
      focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.orange)),
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
Widget buildTextFieldM(String label, String prefix, TextEditingController c, TextInputType tit, {MaskTextInputFormatter mask, Function f}){
  return TextField(
    controller: c,
    inputFormatters: [mask],
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        prefixText: prefix,
        enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.blue)),
        focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.orange)),
    ),
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    onChanged: f,
    keyboardType: tit,
  );
}
