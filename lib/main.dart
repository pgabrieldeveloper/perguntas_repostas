import 'package:flutter/material.dart';
import 'package:perguntas_respostas/questionario.dart';

import 'package:perguntas_respostas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _indicePergunta = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita ?',
      'resposta': ['branco', 'preto', 'azul', 'vermelho']
    },
    {
      'texto': 'Qual seu melhor amigo ?',
      'resposta': ['deivid', 'gabriel', 'tezinha', 'juliano']
    },
    {
      'texto': 'Qual seu animal preferido ?',
      'resposta': ['gato', 'cachorro', 'cobra', 'tigre']
    },
  ];
  bool get temPerguntaSelecionada {
    return _indicePergunta < _perguntas.length;
  }

  void _responder() {
    if (this.temPerguntaSelecionada) {
      setState(() {
        _indicePergunta++;
        print('pergunta respondida');
        print(this._indicePergunta);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //for (String textResp in _perguntas[_indicePergunta].cast()['resposta']) {
    //  widgets.add(Resposta(textResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                indicePergunta: _indicePergunta,
                onSelect: _responder,
              )
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
