import 'dart:io';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ElephantPage extends StatelessWidget {
  const ElephantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elephant Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Elephant Page!',
          style: TextStyle(
              fontSize: 24, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Draw extends StatefulWidget {
  const Draw({super.key});

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  Color selectedColor = Colors.black;
  Color pickerColor = Colors.black;
  double strokeWidth = 3.0;
  List<DrawingPoints> points = [];
  bool showBottomList = false;
  double opacity = 1.0;
  StrokeCap strokeCap = (Platform.isAndroid) ? StrokeCap.butt : StrokeCap.round;
  SelectedMode selectedMode = SelectedMode.StrokeWidth;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '       Start Doodling',
          style: TextStyle(
              fontSize: 24, fontFamily: 'Nunito', fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFFFF585D),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: const Color(0xFFFF585D)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        iconSize: 28,
                        color: Colors.white,
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            if (selectedMode == SelectedMode.StrokeWidth) {
                              showBottomList = !showBottomList;
                            }
                            selectedMode = SelectedMode.StrokeWidth;
                          });
                        }),
                    IconButton(
                        iconSize: 28,
                        color: Colors.white,
                        icon: const Icon(Icons.opacity),
                        onPressed: () {
                          setState(() {
                            if (selectedMode == SelectedMode.Opacity) {
                              showBottomList = !showBottomList;
                            }
                            selectedMode = SelectedMode.Opacity;
                          });
                        }),
                    IconButton(
                        iconSize: 28,
                        color: Colors.white,
                        icon: const Icon(Icons.color_lens),
                        onPressed: () {
                          setState(() {
                            if (selectedMode == SelectedMode.Color) {
                              showBottomList = !showBottomList;
                            }
                            selectedMode = SelectedMode.Color;
                          });
                        }),
                    IconButton(
                        iconSize: 28,
                        color: Colors.white,
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          setState(() {
                            showBottomList = false;
                            points.clear();
                          });
                        }),
                  ],
                ),
                Visibility(
                  visible: showBottomList,
                  child: (selectedMode == SelectedMode.Color)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: getColorList(),
                        )
                      : Slider(
                          value: (selectedMode == SelectedMode.StrokeWidth)
                              ? strokeWidth
                              : opacity,
                          max: (selectedMode == SelectedMode.StrokeWidth)
                              ? 50.0
                              : 1.0,
                          min: 0.0,
                          onChanged: (val) {
                            setState(() {
                              if (selectedMode == SelectedMode.StrokeWidth)
                                strokeWidth = val;
                              else
                                opacity = val;
                            });
                          }),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Swiper(
        itemCount: 1, // Number of items in swiper
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox? renderBox = context.findRenderObject() as RenderBox?;
                if (renderBox != null) {
                  points.add(DrawingPoints(
                      points: renderBox.globalToLocal(details.globalPosition),
                      paint: Paint()
                        ..strokeCap = strokeCap
                        ..isAntiAlias = true
                        ..color = selectedColor.withOpacity(opacity)
                        ..strokeWidth = strokeWidth));
                }
              });
            },
            onPanStart: (details) {
              setState(() {
                RenderBox? renderBox = context.findRenderObject() as RenderBox?;
                if (renderBox != null) {
                  points.add(DrawingPoints(
                      points: renderBox.globalToLocal(details.globalPosition),
                      paint: Paint()
                        ..strokeCap = strokeCap
                        ..isAntiAlias = true
                        ..color = selectedColor.withOpacity(opacity)
                        ..strokeWidth = strokeWidth));
                }
              });
            },
            onPanEnd: (details) {
              setState(() {
                // Do not add null to the list
                points.add(DrawingPoints(
                    points: Offset.zero, // Use an appropriate default value
                    paint: Paint()
                      ..color = selectedColor.withOpacity(opacity)
                      ..strokeWidth = strokeWidth
                      ..strokeCap = strokeCap
                      ..isAntiAlias = true));
              });
            },
            child: CustomPaint(
              size: Size.infinite,
              painter: DrawingPainter(
                pointsList: points,
              ),
            ),
          );
        },
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }

  List<Widget> getColorList() {
    List<Widget> listWidget = [];
    for (Color color in colors) {
      listWidget.add(colorCircle(color));
    }
    Widget colorPicker = GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: (color) {
                  pickerColor = color;
                },
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  setState(() => selectedColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16.0),
          height: 36,
          width: 36,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.red, Colors.green, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
      ),
    );
    listWidget.add(colorPicker);
    return listWidget;
  }

  Widget colorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16.0),
          height: 36,
          width: 36,
          color: color,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter({required this.pointsList});
  List<DrawingPoints> pointsList;
  List<Offset> offsetPoints = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i + 1] != null) {
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));
        canvas.drawPoints(PointMode.points, offsetPoints, pointsList[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}

class DrawingPoints {
  Paint paint;
  Offset points;
  DrawingPoints({required this.points, required this.paint});
}

enum SelectedMode { StrokeWidth, Opacity, Color }
