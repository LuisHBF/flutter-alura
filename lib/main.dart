import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FormularioTransferencia()
      ),
    );
  }
}


class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Criando Transferência'),),
        body: Text('texto texto texto'),
      );
  }

}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Transferências'),),
        body: Column(children: <Widget>[
          ItemTransferencia(Transferencia("1000-x", 350.5)),
          ItemTransferencia(Transferencia("1003-0", 220))
        ],),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        )
    );
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
        )
    );
  }

}

class Transferencia {
  final String _conta;
  final double _valor;

  Transferencia(this._conta, this._valor);


}
