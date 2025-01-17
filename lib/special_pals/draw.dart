import 'package:flutter/material.dart';
import 'doodle.dart';
import 'shapes.dart';

class Drawing extends StatefulWidget {
  const Drawing({super.key});

  @override
  _DrawingState createState() => _DrawingState();
}

class _DrawingState extends State<Drawing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                color: const Color(0xFF9343D4),
                child: const Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 43),
                        Text(
                          'Learn to Draw',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'LoveYaLikeASister',
                              fontSize: 46),
                        ),
                      ],
                    ),
                    Image(
                        height: 200,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        image: AssetImage('assets/colorpalette.png')),
                  ],
                ),
              ),
            ],
          ),
          /*SizedBox(height: 40),
          InkWell(
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => Numbers()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.orangeAccent[200],
                width: 350,
                height: 130,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(image: AssetImage('assets/numbers.jpg')),
                    ),
                    SizedBox(width: 28),
                    Text('Numbers',style: TextStyle(color: Colors.white,fontFamily: 'LoveYaLikeASister', fontSize: 32),),
                  ],
                ),
              ),
            ),
          ), */
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Shapes()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xFF24D382),
                width: 350,
                height: 130,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child:
                          const Image(image: AssetImage('assets/shapes.jpg')),
                    ),
                    const SizedBox(width: 38),
                    const Text(
                      'Shapes',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LoveYaLikeASister',
                          fontSize: 34),
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
                  context, MaterialPageRoute(builder: (context) => Draw()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xFFFF585D),
                width: 350,
                height: 130,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: const Image(image: AssetImage('assets/freeh.jpg')),
                    ),
                    const SizedBox(width: 35),
                    const Text(
                      'Scribble',
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
    );
  }
}
