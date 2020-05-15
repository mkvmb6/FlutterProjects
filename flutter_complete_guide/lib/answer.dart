import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _selectHandler;
  final String _answer;

  Answer(this._selectHandler, this._answer);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(_answer),
        onPressed: _selectHandler,
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
