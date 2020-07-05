import 'package:flutter/material.dart';
import 'package:defensoria/formulario_helper.dart';

class Formulario_2  extends StatefulWidget {
  @override
  _Formulario_2State createState() => _Formulario_2State();
}

class _Formulario_2State extends State<Formulario_2 > {
  FormularioHelper fHelper = FormularioHelper();

  final _cNomeMae = new TextEditingController();            bool _valNomeMae = true;
  final _cNacionalidadeMae = new TextEditingController();   bool _valNacionalidadeMae = true;
  final _cEstadoCivilMae = new TextEditingController();     bool _valEstadoCivilMae = true;
  final _cProfissaoMae = new TextEditingController();       bool _valProfissaoMae = true;
  final _cRGMae = new TextEditingController();              bool _valRGMae = true;
  final _cCPFMae = new TextEditingController();             bool _valCPFMae = true;
  final _cEnderecoMae = new TextEditingController();        bool _valEnderecoMae = true;
  final _cNumeroCasaMae = new TextEditingController();      bool _valNumeroCasaMae = true;
  final _cPontoReferenciaMae = new TextEditingController(); bool _valPontoReferenciaMae = true;
  final _cBairroMae = new TextEditingController();          bool _valBairroMae = true;
  final _cCidadeMae = new TextEditingController();          bool _valCidadeMae = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( "Formulário De Solicitação", style: TextStyle(fontSize: 22)),
          centerTitle: true,
          backgroundColor: fHelper.temaVerde,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Wrap( //Column
            runSpacing: 60,
            children: <Widget>[
              Text('Informações Da Mãe', style: TextStyle(fontSize: 25)),
              fHelper.buildTextField("Nome Completo Da Mãe", "Nome: ", _cNomeMae, TextInputType.text, _valNomeMae),
              fHelper.buildTextField("Nacionalidade", "", _cNacionalidadeMae, TextInputType.text, _valNacionalidadeMae),
              fHelper.buildTextFieldM("Estado Civil", "", _cEstadoCivilMae, TextInputType.text, _valEstadoCivilMae),
              fHelper.buildTextField("Profissão", "", _cProfissaoMae, TextInputType.text, _valProfissaoMae),
              fHelper.buildTextField("RG", "", _cRGMae, TextInputType.number, _valRGMae),
              fHelper.buildTextFieldM("CPF", "", _cCPFMae, TextInputType.number, _valCPFMae),
              fHelper.buildTextField("Endereço", "Rua: ", _cEnderecoMae, TextInputType.text, _valEnderecoMae),
              fHelper.buildTextField("Número Da Casa", "Nº: ", _cNumeroCasaMae, TextInputType.number, _valNumeroCasaMae),
              fHelper.buildTextField("Ponto De Referência", "", _cPontoReferenciaMae, TextInputType.text, _valPontoReferenciaMae),
              fHelper.buildTextField("Bairro", "", _cBairroMae, TextInputType.text, _valBairroMae),
              fHelper.buildTextField("Cidade", "", _cCidadeMae, TextInputType.text, _valCidadeMae),
              Divider(height: 10, color: fHelper.temaVerde),
              RaisedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('PROXIMO', style: TextStyle(fontSize: 22),),
                  textColor: Colors.white,
                  color: fHelper.temaVerde,
                  padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
              )
           ]
          )
        )
    );
  }
}
