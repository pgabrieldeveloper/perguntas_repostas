import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resposta extends StatelessWidget {
  final String _resposta;
  final void Function() onSelect;

  Resposta(this._resposta, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelect,
        child: Text(_resposta),
      ),
    );
  }
}
