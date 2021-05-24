import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Blue', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Lion', 'Rabbit', 'Dog', 'Cat'],
    },
    {
      'questionText': 'What\'s your favorite name?',
      'answers': ['Achal', 'Achal', 'Achal', 'Achal'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App 1'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'].toString(),
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You Did It!'),
              ),
      ),
    );
  }
}
