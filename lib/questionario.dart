import 'package:flutter/cupertino.dart';
import 'package:perguntas_respostas/questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> _perguntas;
  final List<Widget> _Respostas;
  final int _indicePergunta;
  final void Function() onSelect;
  Questionario(
      this._Respostas, this._perguntas, this.onSelect, this._indicePergunta);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Qeustao(_perguntas[_indicePergunta]['texto'].toString()),
        ..._Respostas
      ],
    );
  }
}
