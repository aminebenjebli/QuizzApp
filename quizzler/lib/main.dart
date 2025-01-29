import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:quizzler/quizz_brain.dart';

QuizzBrain quizzBrain = QuizzBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  //   'You bite into a sandwich and find a slug in it. What do you do?',
  //   'You are walking down the street and see a wallet on the ground. What do you do?',
  //   'A slug\'s stomach is full of gas. What do you do?',
  // ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];
  //
  // Question q1 = Question(
  //   questionText: 'You bite into a sandwich and find a slug in it. What do you do?',
  //   questionAnswer: false,
  // );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green, // Text color
              ),
              onPressed: () {
                bool correctAnswers =
                    quizzBrain.getCorrectAnswer();
                if (correctAnswers == true) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }
                setState(() {
                  quizzBrain.nextQuestion();
                });
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // Text color
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswers =
                    quizzBrain.getCorrectAnswer();
                if (correctAnswers == false) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }
                setState(() {
                  quizzBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
//TODO: Add a Question Class
