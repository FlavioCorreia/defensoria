import 'package:flutter/material.dart';
import 'package:defensoria/formulario_helper.dart';

class Formulario_3  extends StatefulWidget {
  @override
  _Formulario_3State createState() => _Formulario_3State();
}

class _Formulario_3State extends State<Formulario_3 > {
  FormularioHelper fHelper = FormularioHelper();

  final _cNomePai = new TextEditingController();            bool _valNomePai = true;
  final _cNacionalidadePai = new TextEditingController();   bool _valNacionalidadePai = true;
  final _cEstadoCivilPai = new TextEditingController();     bool _valEstadoCivilPai = true;
  final _cProfissaoPai = new TextEditingController();       bool _valProfissaoPai = true;
  final _cRGPai = new TextEditingController();              bool _valRGPai = true;
  final _cCPFPai = new TextEditingController();             bool _valCPFPai = true;
  final _cEnderecoPai = new TextEditingController();        bool _valEnderecoPai = true;
  final _cNumeroCasaPai = new TextEditingController();      bool _valNumeroCasaPai = true;
  final _cPontoReferenciaPai = new TextEditingController(); bool _valPontoReferenciaPai = true;
  final _cBairroPai = new TextEditingController();          bool _valBairroPai = true;
  final _cCidadePai = new TextEditingController();          bool _valCidadePai = true;

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
            child: Column(
                children: <Widget>[
                  Divider(height: 10, color: Colors.white),
                  Text('Informações Do Pai', style: TextStyle(fontSize: 25)),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Nome Completo Do Pai", "Nome: ", _cNomePai, TextInputType.text, _valNomePai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Nacionalidade", "", _cNacionalidadePai, TextInputType.text, _valNacionalidadePai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextFieldM("Estado Civil", "", _cEstadoCivilPai, TextInputType.text, _valEstadoCivilPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Profissão", "", _cProfissaoPai, TextInputType.text, _valProfissaoPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("RG", "", _cRGPai, TextInputType.number, _valRGPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextFieldM("CPF", "", _cCPFPai, TextInputType.number, _valCPFPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Endereço", "Rua: ", _cEnderecoPai, TextInputType.text, _valEnderecoPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Número Da Casa", "Nº: ", _cNumeroCasaPai, TextInputType.number, _valNumeroCasaPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Ponto De Referência", "Referência: ", _cPontoReferenciaPai, TextInputType.text, _valPontoReferenciaPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Bairro", "", _cBairroPai, TextInputType.text, _valBairroPai),
                  Divider(height: 10, color: Colors.white),
                  fHelper.buildTextField("Cidade", "", _cCidadePai, TextInputType.text, _valCidadePai)
                ]
            )
        )
    );
  }
}
