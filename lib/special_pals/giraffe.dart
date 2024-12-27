import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart'; // Updated import
import 'package:audioplayers/audioplayers.dart';

class GiraffePage extends StatefulWidget {
  const GiraffePage({super.key});

  @override
  _GiraffePageState createState() => _GiraffePageState();
}

class _GiraffePageState extends State<GiraffePage> {
  // Create an instance of AudioPlayer
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Load the audio asset
    _audioPlayer.setSource(AssetSource('Giraffe.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      _step0(),
      _step1(),
      _step2(),
    ];

    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          Row(
            children: <Widget>[
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back,
                    size: 35, color: Colors.black54),
              ),
              const SizedBox(width: 285),
              const LikeButton(size: 35),
            ],
          ),
          const SizedBox(height: 25),
          const Text(
            'Giraffe',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Giraffe moms give birth to \n              one baby.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Image.asset('assets/giraffe.png', height: 250, width: 420),
          ),
          const SizedBox(height: 25),
          Row(
            children: <Widget>[
              const SizedBox(width: 50),
              InkWell(
                onTap: () {
                  _audioPlayer.play(AssetSource('Giraffe.mp3'));
                },
                child: Container(
                  width: 70,
                  height: 50,
                  color: Colors.deepOrangeAccent,
                  child: const Icon(Icons.music_note,
                      color: Colors.white, size: 36),
                ),
              ),
              const SizedBox(width: 70),
              const Text(
                'Play Sound',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'NunitoSans',
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Text(
            'A Giraffe makes a bleating sound.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints.loose(const Size(350, 170)),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return steps[index];
              },
              itemCount: 3,
              itemHeight: 170,
              itemWidth: 350,
              layout: SwiperLayout.TINDER,
              control: const SwiperControl(color: Colors.black),
              pagination: const SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _step0() {
    return Container(
      height: 170,
      width: 350,
      color: Colors.deepOrangeAccent[100],
      child: const Center(
        child: Text(
          'Giraffes are the tallest \n mammals on Earth.',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _step1() {
    return Container(
      height: 170,
      width: 350,
      color: Colors.deepOrangeAccent[100],
      child: const Center(
        child: Text(
          "They can run as fast as 35 miles \n an hour over short distances.",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _step2() {
    return Container(
      height: 170,
      width: 350,
      color: Colors.deepOrangeAccent[100],
      child: const Center(
        child: Text(
          "A giraffe's neck is too short \n to reach the ground.",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
