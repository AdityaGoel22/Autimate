import 'package:flutter/material.dart';

Color colr = const Color.fromARGB(255, 3, 56, 6);

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: selectHandler,
          style: ElevatedButton.styleFrom(
            backgroundColor: colr, // Background color
            foregroundColor: Colors.white, // Text color
            textStyle: const TextStyle(fontSize: 20), // Text style
          ),
          child: Text(answerText),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]); //Container
  }
}
