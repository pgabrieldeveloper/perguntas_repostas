import 'package:flutter/material.dart';
import 'package:perguntas_respostas/questao.dart';
import 'package:perguntas_respostas/resposta.dart';

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

  void _responder() {
    if (this.temPerguntaSelecionada) {
      setState(() {
        _indicePergunta++;
        print('pergunta respondida');
        print(this._indicePergunta);
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _indicePergunta < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_indicePergunta].cast()['resposta']
        : [];
    List<Widget> widgets =
        respostas.map((text) => Resposta(text, _responder)).toList();
    //for (String textResp in _perguntas[_indicePergunta].cast()['resposta']) {
    //  widgets.add(Resposta(textResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Qeustao(_perguntas[_indicePergunta]['texto'].toString()),
                  ...widgets
                ],
              )
            : Center(
                child: Text(
                  'Parabéns !',
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
