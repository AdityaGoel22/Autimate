import 'package:autism/screens/ISAA/quiz.dart';
import 'package:autism/screens/ISAA/result.dart';
import 'package:flutter/material.dart';
import 'question_isaa.dart';

class IsaaScreen extends StatefulWidget {
  const IsaaScreen({super.key});

  @override
  State<IsaaScreen> createState() => _IsaaScreenState();
}

class _IsaaScreenState extends State<IsaaScreen> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final Color primaryColor = Colors.teal; // Updated to teal

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

  String headerString() {
    if (_questionIndex < 9) {
      return 'I. SOCIAL RELATIONSHIP AND RECIPROCITY';
    } else if (_questionIndex < 14) {
      return 'II. EMOTIONAL RESPONSIVENESS';
    } else if (_questionIndex < 23) {
      return 'III. SPEECH-LANGUAGE AND COMMUNICATION';
    } else if (_questionIndex < 30) {
      return 'IV. BEHAVIOUR PATTERNS';
    } else if (_questionIndex < 36) {
      return 'V. SENSORY ASPECTS';
    } else if (_questionIndex < 40) {
      return 'VI. COGNITIVE COMPONENT';
    } else {
      return 'Results';
    }
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
          "ISAA Test",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(10),
              elevation: 5, // Added elevation for a more modern look
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  headerString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _questionIndex < 40
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: questions,
                  )
                : Result(_totalScore, _resetQuiz),
          ],
        ),
      ),
    );
  }
}
