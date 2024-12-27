import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.tealAccent, // Teal color
                Colors.teal, // Teal accent color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(200.0), // Rounded corners
          ),
          child: ElevatedButton(
            onPressed: selectHandler,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.transparent, // Make button background transparent
              foregroundColor: Colors.white, // Text color
              textStyle: const TextStyle(fontSize: 20), // Text style
              padding:
                  const EdgeInsets.symmetric(vertical: 15), // Button padding
            ),
            child: Text(answerText),
          ),
        ),
        const SizedBox(height: 10), // Space between buttons
      ],
    );
  }
}
