import 'package:autism/screens/report/old_reports.dart';
import 'package:autism/screens/view_all_reports.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  final int? totalScore; // Made it nullable since the new code does not use it

  const ReportScreen({super.key, this.totalScore});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<Map<String, dynamic>> reportItems = [
    {"title": "Create New Report", "icon": Icons.add_chart},
    {"title": "View All Reports", "icon": Icons.view_list},
  ];

  final Color primaryColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Report",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          shrinkWrap: true, // Ensures the list occupies only needed height
          itemCount: reportItems.length,
          itemBuilder: (BuildContext context, int index) {
            final item = reportItems[index];
            return GestureDetector(
              onTap: () => _navigateToReportScreen(context, index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, primaryColor],
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

  void _navigateToReportScreen(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreateOldReport()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ViewAllReportsScreen()));
    }
  }
}
