import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty Likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.orange),
                foregroundColor: WidgetStateProperty.all(Colors.white)),
            child: Text('Restart Quiz'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.yellow),
            ),
            onPressed: null,
            child: Text('A Text Button'),
          ),
          OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.purple),
              ),
              child: Text('An outlined Button'))
        ],
      ),
    );
  }
}
