import 'package:flutter/material.dart';
import 'fruits.dart';
import 'animals.dart';
import 'plants.dart';

class Match extends StatefulWidget {
  const Match({super.key});

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            child: const Row(
              children: <Widget>[
                Image(
                    height: 180,
                    width: 210,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    image: AssetImage('assets/Bevis.png')),
                Column(
                  children: <Widget>[
                    Text(
                      "Hey!",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Nunito',
                          fontSize: 35),
                    ),
                    Text(
                      "I'm Bevis.",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Nunito',
                          fontSize: 35),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.deepOrangeAccent[100],
            child: const Text(
              " Match objects with \n their Colors.",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Nunito', fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ColorGameOne()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.purpleAccent[700],
                width: 350,
                height: 130,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: const Image(
                        image: AssetImage('assets/flowers.png'),
                        height: 102,
                      ),
                    ),
                    const SizedBox(width: 37),
                    const Text(
                      'Plants',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LoveYaLikeASister',
                          fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ColorGame()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.greenAccent[400],
                width: 350,
                height: 130,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Container(
                        color: Colors.white,
                        height: 110,
                        child: const Image(
                          image: AssetImage('assets/fruit.png'),
                          height: 100,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    const Text(
                      'Fruits',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LoveYaLikeASister',
                          fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ColorGameTwo()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.redAccent,
                width: 350,
                height: 130,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Container(
                        color: Colors.white,
                        height: 110,
                        child:
                            const Image(image: AssetImage('assets/anim.png')),
                      ),
                    ),
                    const SizedBox(width: 22),
                    const Text(
                      'Animals',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LoveYaLikeASister',
                          fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
