import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:audioplayers/audioplayers.dart';

class ToucanPage extends StatefulWidget {
  const ToucanPage({super.key});

  @override
  _ToucanPageState createState() => _ToucanPageState();
}

class _ToucanPageState extends State<ToucanPage> {
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
            'Toucan',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Toucan moms lay two \n         to four eggs.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Image.asset('assets/toucan.png', height: 230, width: 420),
          ),
          const SizedBox(height: 25),
          Row(
            children: <Widget>[
              const SizedBox(width: 50),
              InkWell(
                onTap: () {
                  plyr.play(AssetSource('Toucan.mp3'));
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
            'A Toucan makes a clattering sound.',
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
        'Toucans are renowned for \n their large colorful bills.',
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
        "The Toucan's bill is very light \n as it is made of keratin.",
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
        'Toco Toucans also use their \n beaks to pluck and peel fruit.',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'NunitoSans',
          fontSize: 18,
        ),
      ),
    ),
  );
}
