import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int _pontuacaoTotal;
  void Function() onRestart;
  String get fraseResultado {
    if (_pontuacaoTotal == 30) {
      return "parabens você é incrivel uma verdadeira rainha nivel jedi !";
    } else if (_pontuacaoTotal == 29) {
      return "parabén vc é incrivel nivel Shark !";
    } else if (_pontuacaoTotal == 25) {
      return "você é legal !";
    } else if (_pontuacaoTotal == 20) {
      return "você é uma pessoa!";
    }
    return "";
  }

  Resultado(this._pontuacaoTotal, this.onRestart);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                fraseResultado,
                style: TextStyle(fontSize: 28),
              ),
            ),
            TextButton(
              child: Text('Reiniciar ?'),
              onPressed: onRestart,
            )
          ],
        ),
      ),
    );
  }
}
