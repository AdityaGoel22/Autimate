import 'package:autism/special_pals/models/character.dart';
import 'package:autism/special_pals/styleguide.dart';
import 'package:autism/special_pals/widgets/character_widget.dart';
import 'package:flutter/material.dart';

class CharacterListingScreen extends StatefulWidget {
  const CharacterListingScreen({super.key});

  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back, size: 28),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xFFFF977C),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "Hi, I'm Jack.", style: AppTheme.display1),
                      TextSpan(text: "\n"),
                      TextSpan(
                          text: "Meet Bevis! ->", style: AppTheme.display2),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  children: <Widget>[
                    for (var i = 0; i < characters.length; i++)
                      CharacterWidget(
                          character: characters[i],
                          pageController: _pageController,
                          currentPage: i)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
