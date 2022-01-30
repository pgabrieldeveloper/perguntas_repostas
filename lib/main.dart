import 'package:flutter/material.dart';
import 'package:perguntas_respostas/questionario.dart';

import 'package:perguntas_respostas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _indicePergunta = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita ?',
      'resposta': [
        {
          'texto': 'branco',
          'nota': 10,
        },
        {
          'texto': 'preto',
          'nota': 10,
        },
        {
          'texto': 'azul',
          'nota': 10,
        },
        {
          'texto': 'vermelho',
          'nota': 10,
        },
      ]
    },
    {
      'texto': 'Qual seu melhor amigo ?',
      'resposta': [
        {
          'texto': 'deivid',
          'nota': 0,
        },
        {
          'texto': 'gabriel',
          'nota': 10,
        },
        {
          'texto': 'tezinha',
          'nota': 5,
        },
        {
          'texto': 'juliano',
          'nota': 9,
        },
      ]
    },
    {
      'texto': 'Qual seu animal preferido ?',
      'resposta': [
        {
          'texto': 'gato',
          'nota': 10,
        },
        {
          'texto': 'cachorro',
          'nota': 10,
        },
        {
          'texto': 'cobra',
          'nota': 10,
        },
        {
          'texto': 'tigre',
          'nota': 10,
        },
      ]
    },
  ];
  bool get temPerguntaSelecionada {
    return _indicePergunta < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (this.temPerguntaSelecionada) {
      setState(() {
        _indicePergunta++;
        _pontuacaoTotal += pontuacao;
      });
      print(_pontuacaoTotal);
    }
  }

  void _reiniciar() {
    setState(() {
      _indicePergunta = 0;
      _pontuacaoTotal = 0;
    });
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
            : Resultado(_pontuacaoTotal, _reiniciar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
