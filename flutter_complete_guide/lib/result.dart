import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    var resultTxt = 'You\'re a bad person';
    if (totalScore <= 8) {
      resultTxt = 'You are awesome and innocent';
    } else if (totalScore < 16) {
      resultTxt = 'You are... Strange?!';
    }
    return resultTxt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resetQuiz,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
