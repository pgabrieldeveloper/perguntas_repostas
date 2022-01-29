import 'package:flutter/cupertino.dart';
import 'package:perguntas_respostas/questao.dart';
import 'package:perguntas_respostas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int indicePergunta;
  final void Function() onSelect;

  bool get temPerguntaSelecionada {
    return indicePergunta < perguntas.length;
  }

  Questionario({
    required this.perguntas,
    required this.indicePergunta,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    print(perguntas[indicePergunta]['texto'].toString());
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[indicePergunta].cast()['resposta']
        : [];
    return Column(
      children: [
        Qeustao(perguntas[indicePergunta]['texto'].toString()),
        ...respostas.map((text) => Resposta(text, onSelect)).toList()
      ],
    );
  }
}
