import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class ColorGame extends StatefulWidget {
  const ColorGame({super.key});

  @override
  ColorGameState createState() => ColorGameState();
}

class ColorGameState extends State<ColorGame> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for the game
  final Map<String, Color> choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍒': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥭': Colors.orange,
  };

  // Random seed to shuffle order of items
  int seed = 0;

  // Audio player instance
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Ensure the audio file is preloaded
    _audioPlayer.setSource(AssetSource('Bell.mp3'));
  }

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
        backgroundColor: Colors.greenAccent[400],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[400],
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
              color: choices[emoji], // Match the color for the target
              height: 80,
              width: 150,
            ),
          );
        }
      },
      onWillAccept: (data) => data == emoji, // Accept only the correct emoji
      onAccept: (data) {
        setState(() {
          score[emoji] = true; // Mark the emoji as correctly matched
          _audioPlayer.play(AssetSource('Bell.mp3')); // Play success sound
        });
      },
      onLeave: (data) {
        // Optional: Handle case when emoji is dragged away without dropping
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
