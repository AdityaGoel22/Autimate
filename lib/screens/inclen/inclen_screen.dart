import 'package:autism/screens/inclen/questions_inclen.dart';
import 'package:autism/screens/inclen/quiz.dart';
import 'package:autism/screens/inclen/result.dart';
import 'package:flutter/material.dart';

class InclenScreen extends StatefulWidget {
  const InclenScreen({super.key});

  @override
  State<InclenScreen> createState() => _InclenScreenState();
}

class _InclenScreenState extends State<InclenScreen> {
  var _questionIndex = 0;
  var _totalScore = 0;
  Color colr = Colors.teal;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "INCLEN Test",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colr,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _questionIndex < questionsi.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: questionsi,
                    )
                  : Result(_totalScore, _resetQuiz),
            ],
          )),
    );
  }
}
