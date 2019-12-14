class Transferencia {
  final String conta;
  final double valor;

  Transferencia(this.conta, this.valor);

  @override
  String toString() {
    return 'Transferencia{_conta: $conta, _valor: $valor}';
  }
}
