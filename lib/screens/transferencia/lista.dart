import 'package:curso_flutter/models/transferencia.dart';
import 'package:curso_flutter/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final Transferencia transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              final Future<Transferencia> future =
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormularioTransferencia();
              }));

              future.then((transferencia) => atualiza(transferencia));
            }));
  }

  void atualiza(Transferencia transferencia) {
    if (transferencia != null) {
      setState(() {
        widget._transferencias.add(transferencia);
      });
    }
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
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.conta),
    ));
  }
}
