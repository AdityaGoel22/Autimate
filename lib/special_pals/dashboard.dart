import 'package:autism/screens/home_screen.dart';
import 'package:autism/screens/recite.dart';
import 'package:flutter/material.dart';
import 'draw.dart';
import 'puzzle.dart';
import 'quiz.dart';
import 'story.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF24D382),
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
      ),
      backgroundColor: const Color(0xFF24D382),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 0),
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Pick a Course',
                    style: TextStyle(
                        fontFamily: 'LoveYaLikeASister',
                        color: Colors.white,
                        fontSize: 46.0)),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 110.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Story()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFFFF585D),
                      width: 370,
                      height: 115,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: const Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                              image: AssetImage("assets/book.jpg"),
                            ),
                          ),
                          const SizedBox(width: 25),
                          const Text(
                            '   Stories',
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
                        MaterialPageRoute(builder: (context) => Drawing()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFF9343D4),
                      width: 370,
                      height: 115,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: const Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                              image: AssetImage("assets/d.png"),
                            ),
                          ),
                          const SizedBox(width: 50),
                          const Text(
                            'Draw',
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
                        MaterialPageRoute(builder: (context) => Quiz()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.pinkAccent[200],
                      width: 370,
                      height: 115,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: const Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                              image: AssetImage("assets/kids.jpg"),
                            ),
                          ),
                          const SizedBox(width: 46),
                          const Text(
                            'Quiz Time',
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
                        MaterialPageRoute(builder: (context) => Puzzle()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFF5DDEE8),
                      width: 370,
                      height: 115,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: const Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                              image: AssetImage("assets/puzzle.jpg"),
                            ),
                          ),
                          const SizedBox(width: 37),
                          const Text(
                            'Puzzles',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReciteWithBeepApp()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color.fromARGB(255, 5, 63, 1),
                      width: 370,
                      height: 115,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: const Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                              image: AssetImage("assets/recite_icon.jpg"),
                            ),
                          ),
                          const SizedBox(width: 37),
                          const Text(
                            'Recite',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
