import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class ColorGameOne extends StatefulWidget {
  const ColorGameOne({super.key});

  @override
  ColorGameOneState createState() => ColorGameOneState();
}

class ColorGameOneState extends State<ColorGameOne> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for the game
  final Map<String, Color?> choices = {
    '🌰': Colors.brown,
    '🌻': Colors.yellow,
    '🌷': Colors.pinkAccent,
    '🌵': Colors.green,
    '🌹': Colors.red,
  };

  // Random seed to shuffle order of items.
  int seed = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '            Score ${score.length} / 5',
          style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent[700],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent[700],
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((emoji) {
              return Draggable<String>(
                data: emoji,
                feedback: Emoji(emoji: emoji),
                childWhenDragging: Emoji(emoji: ''),
                child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
              );
            }).toList(),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(seed)),
          ),
        ],
      ),
    );
  }

  Widget _buildDragTarget(String emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[emoji] == true) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              height: 80,
              width: 140,
              child: const Text(
                'Correct!',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Container(
              color: choices[emoji] ?? Colors.grey, // Ensures null safety
              height: 80,
              width: 150,
            ),
          );
        }
      },
      onWillAccept: (data) {
        return data == emoji; // Compare dragged emoji with the target emoji
      },
      onAccept: (data) {
        setState(() {
          score[emoji] = true; // Update score if the match is correct
          _audioPlayer
              .play(AssetSource('Bell.mp3')); // Play sound on correct match
        });
      },
      onLeave: (data) {
        // Optional: Handle when an emoji is dragged away without being dropped
      },
    );
  }
}

class Emoji extends StatelessWidget {
  const Emoji({super.key, required this.emoji});

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 90,
            padding: const EdgeInsets.all(10),
            child: Text(
              emoji,
              style: const TextStyle(color: Colors.black, fontSize: 50),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
