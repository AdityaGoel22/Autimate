import 'package:flutter/material.dart';
import 'data.dart';
import 'page_indicator.dart';
import 'package:text_gradiate/text_gradiate.dart'; // Updated import
import 'dashboard.dart';

class JackPage extends StatefulWidget {
  const JackPage({super.key});

  @override
  _JackPageState createState() => _JackPageState();
}

class _JackPageState extends State<JackPage> with TickerProviderStateMixin {
  late PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  late AnimationController animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _scaleAnimation =
        Tween<double>(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    animationController.dispose(); // Dispose the animation controller as well
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29323C)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFDF4161),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reset();
                  }
                  print(lastPage);
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    double y = 1.0;

                    // if (_controller.hasClients) {
                    //   delta = (_controller.page ?? index.toDouble()) - index.toDouble();
                    //   y = 1 - delta.abs().clamp(0.0, 1.0);
                    // }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(page.imageUrl),
                        const SizedBox(height: 3),
                        Container(
                          margin: const EdgeInsets.only(left: 12.0),
                          height: 120.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: .10,
                                child: TextGradiate(
                                  text: Text(
                                    page.title,
                                    style: const TextStyle(
                                      fontSize: 85.0,
                                      fontFamily: "Nunito",
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  colors: pageList[index].titleGradient,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, left: 22.0),
                                child: TextGradiate(
                                  text: Text(
                                    page.title,
                                    style: const TextStyle(
                                      fontSize: 60.0,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                  colors: pageList[index].titleGradient,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34.0, top: 12.0),
                          child: Transform(
                            transform:
                                Matrix4.translationValues(0, 50.0 * (1 - y), 0),
                            child: Text(
                              page.body,
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "NunitoSans",
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: SizedBox(
                  width: 160.0,
                  child: PageIndicator(currentPage, pageList.length)),
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DashboardPage()));
                        },
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
