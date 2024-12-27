import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:audioplayers/audioplayers.dart';

class ChameleonPage extends StatefulWidget {
  const ChameleonPage({super.key});

  @override
  _ChameleonPageState createState() => _ChameleonPageState();
}

class _ChameleonPageState extends State<ChameleonPage> {
  final AudioPlayer _player = AudioPlayer();

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
            'Chameleon',
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
            'Chameleon moms give birth to \n    eight to thirty young ones.',
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
              image: AssetImage('assets/chameleon.png'),
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
                onTap: () {
                  _player.play(AssetSource(
                      'Chameleon.mp3')); // Updated method for playing audio
                },
                child: Container(
                  width: 70,
                  height: 50,
                  color: Colors.deepOrangeAccent,
                  child: const Icon(
                    Icons.notifications_off,
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
            'A Chameleon does not make a sound.',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 21,
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
        "Chameleons are reptiles that are \n part of the iguana suborder.",
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
        "These colorful lizards are known \n as one of the few animals that \n can change skin color.",
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
        'Their hands and feet have large \n toes that help them cling to \n branches.',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
            fontSize: 18),
      ),
    ),
  );
}