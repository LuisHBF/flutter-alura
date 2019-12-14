import 'package:curso_flutter/components/editor.dart';
import 'package:curso_flutter/models/transferencia.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Criando Transferência';

const String _rotuloCampoValor = '0.00';
const String _dicaCampoValor = 'Valor';

const String _rotuloCampoConta = '0000-0';
const String _dicaCampoConta = 'Número da Conta';

const String _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final String conta = _controladorCampoNumeroConta.text;

    if (conta != null && valor != null) {
      final Transferencia transferenciaCriada = Transferencia(conta, valor);

      Navigator.pop(context, transferenciaCriada);
      debugPrint('$transferenciaCriada');
    }
  }

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: widget._controladorCampoNumeroConta,
                  dica: _dicaCampoConta,
                  rotulo: _rotuloCampoConta),
              Editor(
                controlador: widget._controladorCampoValor,
                dica: _dicaCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () {
                  widget._criaTransferencia(context);
                },
              )
            ],
          ),
        ));
  }
}
