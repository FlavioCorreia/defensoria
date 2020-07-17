import 'package:flutter/material.dart';
import 'package:defensoria/formulario_helper.dart';
import 'package:defensoria/formulario_3.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  final maskCPFMae = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });

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
            runSpacing: 30,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child:Text('Informações Da Mãe', style: TextStyle(fontSize: 25))
              ),
              fHelper.buildTextField("Nome Completo Da Mãe", "Nome: ", _cNomeMae, TextInputType.text, _valNomeMae),
              fHelper.buildTextField("Nacionalidade", "", _cNacionalidadeMae, TextInputType.text, _valNacionalidadeMae),
              fHelper.buildTextField("Estado Civil", "", _cEstadoCivilMae, TextInputType.text, _valEstadoCivilMae),
              fHelper.buildTextField("Profissão", "", _cProfissaoMae, TextInputType.text, _valProfissaoMae),
              fHelper.buildTextField("RG", "", _cRGMae, TextInputType.number, _valRGMae),
              fHelper.buildTextFieldM("CPF", "", _cCPFMae, TextInputType.number, _valCPFMae, maskCPFMae),
              fHelper.buildTextField("Endereço", "Rua: ", _cEnderecoMae, TextInputType.text, _valEnderecoMae),
              fHelper.buildTextField("Número Da Casa", "Nº: ", _cNumeroCasaMae, TextInputType.number, _valNumeroCasaMae),
              fHelper.buildTextField("Ponto De Referência", "", _cPontoReferenciaMae, TextInputType.text, _valPontoReferenciaMae),
              fHelper.buildTextField("Bairro", "", _cBairroMae, TextInputType.text, _valBairroMae),
              fHelper.buildTextField("Cidade", "", _cCidadeMae, TextInputType.text, _valCidadeMae),
              Divider(height: 10, color: fHelper.temaVerde),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {
                      if(_cNomeMae.text.isEmpty) { //SE N PREENCHER O NOME
                          fHelper.buildShowDialog(context, "PREENCHIMENTO DE CAMPOS", "OPS... parece que algum campo não foi preenchido corretamente \n(Nome Completo da Mãe)");
                          setState(() { _valNomeMae = false; });
                          return;
                      }else{
                          setState(() { _valNomeMae = true; });
                      }
                      if(_cCPFMae.text.length == 14){//CPF 14 DIGITOS+PNTC
                          //print(_cCPFMae.text);
                          if(fHelper.validaCPF(_cCPFMae.text)){//SE FOR VALIDO, AVANCE
                              setState(() {
                                  _valCPFMae = true;
                              });
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Formulario_3())
                              );
                          }else{
                              fHelper.buildShowDialog(context, "PREENCHIMENTO DE CAMPOS", "OPS... parece que algum campo não foi preenchido corretamente \n(CPF)");
                              setState(() { _valCPFMae = false; });
                          }
                      }else{
                          fHelper.buildShowDialog(context, "PREENCHIMENTO DE CAMPOS", "OPS... parece que algum campo não foi preenchido corretamente \n(CPF)");
                          setState(() { _valCPFMae = false; });
                      }
                  },
                  child: Text('PROXIMO', style: TextStyle(fontSize: 22),),
                  textColor: Colors.white,
                  color: fHelper.temaVerde,
                  padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                )
              ),
              Padding( padding: EdgeInsets.only(top: 70))
            ]
          )
        )
    );
  }
}
