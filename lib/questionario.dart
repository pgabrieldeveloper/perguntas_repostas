import 'package:flutter/cupertino.dart';
import 'package:perguntas_respostas/questao.dart';
import 'package:perguntas_respostas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int indicePergunta;
  final void Function(int) onSelect;

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
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[indicePergunta].cast()['resposta']
        : [];
    return Column(
      children: [
        Qeustao(perguntas[indicePergunta]['texto'].toString()),
        ...respostas.map((res) {
          return Resposta(res['texto'].toString(), () {
            onSelect(int.parse(res['nota'].toString()));
          });
        })
      ],
    );
  }
}
