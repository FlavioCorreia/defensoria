import 'package:flutter/material.dart';
import 'package:defensoria/formulario_helper.dart';

class Forlumario_1 extends StatefulWidget {
  @override
  _Forlumario_1State createState() => _Forlumario_1State();
}

class _Forlumario_1State extends State<Forlumario_1> {
  FormularioHelper fHelper = FormularioHelper();

  List<String> _listaNomes = List();
  final _cNomeCrianca = new TextEditingController();        bool _valNomeCrianca = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Divider(height: 10, color: Colors.white),
            Text('Informações Do(s) Filho(s)', style: TextStyle(fontSize: 25)),
            Divider(height: 10, color: Colors.white),
            fHelper.buildTextField("Nome Completo", "Nome: ", _cNomeCrianca, TextInputType.text, _valNomeCrianca),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton( child: Text("ADICIONAR", style: TextStyle(fontSize: 18)), textColor: Colors.white, color: fHelper.temaVerde,
              onPressed: (){
                if (_cNomeCrianca.text.isEmpty || _cNomeCrianca.text == "") return null;
                  setState(() {
                    _listaNomes.add(_cNomeCrianca.text);
                    _cNomeCrianca.clear();
                  });
              }
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _listaNomes.length,
              itemBuilder: (context, index) {
                return Container( padding: EdgeInsets.only(top: 8),
                  child: Dismissible(
                    key: Key( DateTime.now().millisecondsSinceEpoch.toString()),
                    background: Container(
                      color: Colors.orange,
                      child: Align(
                        alignment: Alignment(-0.85, 0),
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                    direction: DismissDirection.startToEnd,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(child: Text(_listaNomes[index], style: TextStyle(fontSize: 22))),
                        IconButton(tooltip: "Apagar nome", icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: (){
                            setState(() {
                              _listaNomes.removeAt(index);
                            });
                          }
                        )
                      ]
                    ),
                    onDismissed: (direction){//APAGAR QUANDO ARRASTA P/ DIREITA
                      setState(() {
                        _listaNomes.removeAt(index);
                      });
                    }
                  )
                );
              }
            )
          ]
        ),
      )
    );
  }
}
