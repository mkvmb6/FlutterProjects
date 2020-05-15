import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const _questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 6},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ]
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 2},
          {'text': 'Dog', 'score': 5},
          {'text': 'Snake', 'score': 10},
          {'text': 'Lion', 'score': 8},
        ]
      },
      {
        'questionText': 'Who\'s your favourite instructor?',
        'answers': [
          {'text': 'Myself', 'score': 10},
          {'text': 'Mohit', 'score': 8},
          {'text': 'Mosh', 'score': 4},
          {'text': 'Max', 'score': 4},
        ]
      },
    ];
    void _answerQuestion(int score) {
      _totalScore += score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }

    void _resetQuiz(){
      setState(() {
        _questionIndex=0;
        _totalScore=0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
