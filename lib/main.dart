import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: ListaTransferencia()),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                dica: 'Número da Conta',
                rotulo: '0000-0'),
            Editor(
              controlador: _controladorCampoValor,
              dica: 'Valor',
              rotulo: '0.00',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                _criaTransferencia(context);
              },
            )
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final double valor =
        double.tryParse(_controladorCampoValor.text);
    final String conta = _controladorCampoNumeroConta.text;

    if (conta != null && valor != null) {
      final Transferencia transferenciaCriada =
          Transferencia(conta, valor);
      
      Navigator.pop(context, transferenciaCriada);
      debugPrint('$transferenciaCriada');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica),
        style: TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatefulWidget {

  List<Transferencia> _transferencias = List();


  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice){
            final Transferencia transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context){
                return FormularioTransferencia();
              }));

              future.then((transferencia)  {
                widget._transferencias.add(transferencia);
              });
            }
        ));
  }

}

class ItemTransferencia extends StatelessWidget {
  Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia._valor.toString()),
      subtitle: Text(_transferencia._conta),
    ));
  }
}

class Transferencia {
  final String _conta;
  final double _valor;

  Transferencia(this._conta, this._valor);

  @override
  String toString() {
    return 'Transferencia{_conta: $_conta, _valor: $_valor}';
  }
}
