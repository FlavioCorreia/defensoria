import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //CONTROLADORES E BOOLEANOS DE VALIDAÇÃO
  final _cNomeMae = new TextEditingController();            bool _valNomeMae = true;
  final _cCPFMae = new TextEditingController();             bool _valCPFMae = true;
  final _cFoneMae = new TextEditingController();            bool _valFoneMae = true;
  final _cNomePai = new TextEditingController();            bool _valNomePai = true;
  final _cCPFPai = new TextEditingController();             bool _valCPFPai = true;
  final _cEnderecoPai = new TextEditingController();        bool _valEnderecoPai = true;
  final _cNomeCrianca = new TextEditingController();        bool _valNomeCrianca = true;
  final _cCPFCrianca = new TextEditingController();         bool _valCPFCrianca = true;
  final _cDataCrianca = new TextEditingController();        bool _valDataCrianca = true;

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
            buildTextField("Nome Completo Da Mãe", "Nome: ", _cNomeMae, TextInputType.text, _valNomeMae),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF Da Mãe", "CPF: ", _cCPFMae, TextInputType.number, _valCPFMae, mask: maskCPFMae),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("Contato Da Mãe", "Telefone: ", _cFoneMae, TextInputType.phone, _valFoneMae, mask: maskFone),

            Divider(height: 35, color: Colors.blue),
            buildTextField("Nome Completo Do Pai", "Nome: ", _cNomePai, TextInputType.text, _valNomePai),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF Do Pai", "CPF: ", _cCPFPai, TextInputType.number, _valCPFPai, mask: maskCPFPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Endereço Do Pai", "End.: ", _cEnderecoPai, TextInputType.text, _valEnderecoPai),

            Divider(height: 35, color: Colors.blue),
            buildTextField("Nome Completo Da Criança", "Nome: ", _cNomeCrianca, TextInputType.text, _valNomeCrianca),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF Da Criança", "CPF: ", _cCPFCrianca, TextInputType.number, _valCPFCrianca, mask: maskCPFFilho),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("Nascimento Da Criança", "Data: ", _cDataCrianca, TextInputType.datetime, _valDataCrianca, mask: maskData),

            Divider(height: 35, color: Colors.blue),
            RaisedButton(
              onPressed: () {
                setState(() { // SE ALGUM CAMPO ESTIVER VAZIO OU INCOMPLETO, TORNE-O INVALIDO
                 _cNomeMae.text.isEmpty ? _valNomeMae = false : _valNomeMae = true;
                 _cCPFMae.text.length != 14  ? _valCPFMae = false : _valCPFMae = true; // 11 CPF 2 . 1 -
                 _cFoneMae.text.length != 16 ? _valFoneMae = false : _valFoneMae = true; // () - ' ' => 5
                 _cNomePai.text.isEmpty ? _valNomePai = false : _valNomePai = true;
                 _cCPFPai.text.length != 14  ? _valCPFPai = false : _valCPFPai = true;
                 _cEnderecoPai.text.isEmpty ? _valEnderecoPai = false : _valEnderecoPai  = true;
                 _cNomeCrianca.text.isEmpty ? _valNomeCrianca = false : _valNomeCrianca = true;
                 _cCPFCrianca.text.length != 14 ? _valCPFCrianca = false : _valCPFCrianca = true;
                 _cDataCrianca.text.length != 10 ? _valDataCrianca = false : _valDataCrianca = true; // // => 2
                });

                if(_valNomeMae && _valCPFMae && _valFoneMae && _valNomePai && _valCPFPai &&
                    _valEnderecoPai && _valNomeCrianca && _valCPFCrianca && _valDataCrianca){
                  //SE TODOS OS CAMPOS ESTIVEREM CORRETOS
                  _showDialog(context, "", "Formulário enviado com sucesso.");
                }else{
                  _showDialog(context, "Campos Incorretos", "Alguns campos não foram preenchidos corretamente, reinforme os campos destacados.");
                }
              },
              child: Text('Enviar Formulario', style: TextStyle(fontSize: 22),),
              textColor: Colors.white,
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
            )
          ],
        )
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c, TextInputType tit, bool validator, {Function f}){
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(),
      prefixText: prefix,
      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.blue)),
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
    controller: c,
    inputFormatters: [mask],
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        prefixText: prefix,
        enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.blue)),
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

void _showDialog(context, String titulo, String mensagem){
    Color corFundo; //COR DE FUNDO MUDA DE ACORDO COM O ESTADO AZUL -> OK / LARANJA -> !OK
    titulo == "" ? corFundo = Colors.blue : corFundo = Color.fromARGB(255, 247, 149, 0);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: corFundo,
          title: Text(titulo, style: TextStyle(fontSize: 22, color: Colors.white), textAlign: TextAlign.center),
          content: Text(mensagem, style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.justify,),
          actions: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              textColor: corFundo,
              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: Text("OK", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

