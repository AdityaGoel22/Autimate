import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:audioplayers/audioplayers.dart';

class ZebraPage extends StatefulWidget {
  const ZebraPage({super.key});

  @override
  _ZebraPageState createState() => _ZebraPageState();
}

class _ZebraPageState extends State<ZebraPage> {
  final AudioPlayer plyr = AudioPlayer();

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
            'Zebra',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Zebra moms give birth to \n              one foal.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Image.asset('assets/zebra.png', height: 250, width: 420),
          ),
          const SizedBox(height: 25),
          Row(
            children: <Widget>[
              const SizedBox(width: 50),
              InkWell(
                onTap: () {
                  plyr.play(AssetSource('zebra.mp3'));
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
            'A Zebra makes a snorting sound.',
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
}

Widget _step0() {
  return Container(
    height: 170,
    width: 350,
    color: Colors.deepOrangeAccent[100],
    child: const Center(
      child: Text(
        'Zebras are single-hoofed animals \n that are native to Africa.',
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
        " Each species of zebra has a \n different general pattern of stripes.",
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
        'The most prominent feature \n of zebras is the bold patterns \n on their coats.',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'NunitoSans',
          fontSize: 18,
        ),
      ),
    ),
  );
}
