import 'package:flutter/material.dart';
import 'hippo.dart';
import 'elephant.dart';
import 'chameleon.dart';

class FrtwoPage extends StatefulWidget {
  const FrtwoPage({super.key});

  @override
  _FrtwoPageState createState() => _FrtwoPageState();
}

class _FrtwoPageState extends State<FrtwoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fr2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 390),
              Row(
                children: <Widget>[
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HippoPage()),
                      );
                    },
                    child: Container(
                      child: const Image(
                        image: AssetImage('assets/hippo.png'),
                        height: 240,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ElephantPage()),
                      );
                    },
                    child: Container(
                      child: const Image(
                        image: AssetImage('assets/elephant.png'),
                        height: 240,
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: <Widget>[
                  SizedBox(width: 45),
                  // Text(
                  //   'Hippo',
                  //   style: TextStyle(
                  //     fontFamily: 'Nunito',
                  //     color: Colors.white,
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(width: 135),
                  // Text(
                  //   'Elephant',
                  //   style: TextStyle(
                  //     fontFamily: 'Nunito',
                  //     color: Colors.white,
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 52),
              Row(
                children: <Widget>[
                  const SizedBox(width: 27),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChameleonPage()),
                      );
                    },
                    child: Container(
                      child: const Image(
                        image: AssetImage('assets/chameleon.png'),
                        height: 120,
                      ),
                    ),
                  ),
                  // Text(
                  //   'Chameleon',
                  //   style: TextStyle(
                  //     fontFamily: 'Nunito',
                  //     color: Colors.white,
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(width: 81),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
