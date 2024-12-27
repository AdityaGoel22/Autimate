import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class ColorGameTwo extends StatefulWidget {
  const ColorGameTwo({super.key});

  @override
  ColorGameTwoState createState() => ColorGameTwoState();
}

class ColorGameTwoState extends State<ColorGameTwo> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for the game
  final Map<String, Color?> choices = {
    '🦁': Colors.yellow[600],
    '🐯': Colors.orangeAccent[700],
    '🐷': Colors.pink[100],
    '🐻': Colors.brown,
    '🐸': Colors.green,
  };

  // Random seed to shuffle order of items
  int seed = 0;

  // AudioPlayer instance
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Score ${score.length} / ${choices.length}',
          style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
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
          // Draggable emoji list
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
          // Drag targets (colors)
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
              color: choices[emoji],
              height: 80,
              width: 150,
              child: incoming.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                    )
                  : null,
            ),
          );
        }
      },
      onWillAccept: (data) => data == emoji, // Match dragged emoji to target
      onAccept: (data) {
        setState(() {
          score[emoji] = true; // Mark as correct if matched
          _playSound('Bell.mp3');
        });
      },
      onLeave: (data) {
        // Optional: Visual feedback for rejected items
      },
    );
  }

  void _playSound(String fileName) async {
    // Play audio from assets
    await _audioPlayer.play(AssetSource(fileName));
  }

  @override
  void dispose() {
    // Dispose the audio player to free resources
    _audioPlayer.dispose();
    super.dispose();
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
