import 'package:flutter/material.dart';
import 'lion.dart';
import 'toucan.dart';
import 'armadillo.dart';

class FronePage extends StatefulWidget {
  const FronePage({super.key});

  @override
  _FronePageState createState() => _FronePageState();
}

class _FronePageState extends State<FronePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fr1.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 14,
              ),
              Text(
                'Tap us to know more.',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 58,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ToucanPage()));
                },
                child: Container(
                  child: const Image(
                      image: AssetImage('assets/toucan.png'), height: 140),
                ),
              ),
              // Text('Toucan', style: TextStyle(
              //   fontFamily: 'Nunito', color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold,
              // ),),
              const SizedBox(
                height: 99,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LionPage()));
                },
                child: Container(
                  child: const Image(
                    image: AssetImage('assets/lion.png'),
                    height: 250,
                    width: 420,
                  ),
                ),
              ),
              const Text(
                ' ',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArmadilloPage()));
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 130,
                        ),
                        Container(
                          child: const Image(
                              image: AssetImage('assets/armadillo.png'),
                              height: 118),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(
                children: <Widget>[
                  SizedBox(width: 46),
                  Text(
                    ' ',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 75),
                  // Text(
                  //   'Swipe -->',
                  //   style: TextStyle(
                  //     fontFamily: 'Nunito',
                  //     color: Colors.white,
                  //     fontSize: 32,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
