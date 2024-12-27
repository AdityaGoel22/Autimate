import 'package:autism/repository/authentication_repository/authentication_repository.dart';
import 'package:autism/screens/report_screen.dart';
import 'package:autism/screens/test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../special_pals/intro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Test", "icon": Icons.assessment},
    {"title": "Report", "icon": Icons.description},
    {"title": "Task", "icon": Icons.task},
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text("Home", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _buildDrawerItem(Icons.message_outlined, "FAQs"),
            _buildDrawerItem(Icons.settings_outlined, "Settings"),
            _buildDrawerItem(Icons.edit, "Edit Profile"),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.teal,
              ),
              title: const Text("Logout"),
              onTap: () => AuthenticationRepository.instance.logOut(),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          shrinkWrap:
              true, // Makes the list occupy only as much height as needed
          itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () => _navigateToScreen(context, index),
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

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const TestScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const ReportScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => IntroPage()),
        );
        break;
    }
  }
}
