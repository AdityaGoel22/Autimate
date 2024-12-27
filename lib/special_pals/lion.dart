import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:audioplayers/audioplayers.dart';

class LionPage extends StatefulWidget {
  const LionPage({super.key});

  @override
  _LionPageState createState() => _LionPageState();
}

class _LionPageState extends State<LionPage> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer(); // Initialize the audio player
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
          const SizedBox(
            height: 40,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                width: 285,
              ),
              const LikeButton(
                size: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Lion',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: 'Nunito'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Lion moms give birth to one to \n       five cubs in each litter.',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Nunito'),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: const Image(
              image: AssetImage('assets/lion.png'),
              height: 250,
              width: 420,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 50,
              ),
              InkWell(
                onTap: () async {
                  await audioPlayer
                      .play(AssetSource('lion.mp3')); // Play the audio file
                },
                child: Container(
                  width: 70,
                  height: 50,
                  color: Colors.deepOrangeAccent,
                  child: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              const Text(
                'Play Sound',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'NunitoSans'),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'A Lion makes a roaring sound.',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Nunito'),
          ),
          const SizedBox(
            height: 25,
          ),
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
}

Widget _step0() {
  return Container(
    height: 170,
    width: 350,
    color: Colors.deepOrangeAccent[100],
    child: const Center(
      child: Text(
        'Lions are the second largest big cat \n species in the world (behind tigers).',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
            fontSize: 18),
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
        'The roar of a lion can be heard \n from 8 kilometers (5.0 miles) away.',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
            fontSize: 18),
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
        'In the wild, lions rest \n for around 20 hours a day.',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
            fontSize: 18),
      ),
    ),
  );
}
