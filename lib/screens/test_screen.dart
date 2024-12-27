import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autism/screens/ISAA/isaa_screen.dart';
import 'package:autism/screens/inclen/inclen_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<Map<String, dynamic>> testItems = [
    {"title": "ISAA", "icon": Icons.insert_chart_outlined},
    {"title": "INCLEN", "icon": Icons.insert_chart_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text("Test", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          shrinkWrap: true, // Ensures the list doesn't take extra space
          itemCount: testItems.length,
          itemBuilder: (BuildContext context, int index) {
            final item = testItems[index];
            return GestureDetector(
              onTap: () => _navigateToTestScreen(context, index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.tealAccent, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(4, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item["icon"], color: Colors.white, size: 40),
                    const SizedBox(height: 10),
                    Text(
                      item["title"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToTestScreen(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => const IsaaScreen()),
      );
    } else {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => const InclenScreen()),
      );
    }
  }
}
