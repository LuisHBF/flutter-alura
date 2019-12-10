import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: FormularioTransferencia()),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Número da Conta', hintText: '0000-0'),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Valor',
                    hintText: '0.00',
                    icon: Icon(Icons.monetization_on)),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text('Confirmar'),
            )
          ],
        ));
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: Column(
          children: <Widget>[
            ItemTransferencia(Transferencia('1000-X', 350.5)),
            ItemTransferencia(Transferencia('1100-0', 220))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
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
}
