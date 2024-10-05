import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main(){
//   runApp(MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 5},
        {'text': 'Dog', 'score': 1},
        {'text': 'Ox', 'score': 8},
        {'text': 'Cow', 'score': 3}
      ]
    },
    {
      'questionText': 'Who\'s is your favourite instructor?',
      'answers': [
        {'text': 'John', 'score': 1},
        {'text': 'Dean', 'score': 6},
        {'text': 'Emin', 'score': 2},
        {'text': 'Carol', 'score': 4}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('My First App'),
            ),
            body: (_questionIndex < _questions.length)
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz)));
  }
}
