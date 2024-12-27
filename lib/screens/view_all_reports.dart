import 'package:autism/screens/report_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewAllReportsScreen extends StatefulWidget {
  const ViewAllReportsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ViewAllReportsScreenState createState() => _ViewAllReportsScreenState();
}

class _ViewAllReportsScreenState extends State<ViewAllReportsScreen> {
  late Stream<QuerySnapshot> reportsStream;
  Color primaryColor = Colors.teal; // Updated to teal
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    reportsStream = FirebaseFirestore.instance
        .collection('reports')
        .where('userId',
            isEqualTo: FirebaseAuth.instance.currentUser?.uid) // Add this line
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'View All Reports',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchField(),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: reportsStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final reports = snapshot.data?.docs.where((report) {
                        final data = report.data() as Map<String, dynamic>;
                        final patientId =
                            data['patientId'].toString().toLowerCase();
                        return patientId.contains(searchQuery);
                      }).toList() ??
                      [];

                  if (reports.isEmpty) {
                    return const Center(child: Text('No reports found.'));
                  }

                  return ListView.builder(
                    itemCount: reports.length,
                    itemBuilder: (context, index) {
                      final report = reports[index];
                      final data = report.data() as Map<String, dynamic>;

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text('Patient ID: ${data['patientId']}'),
                          subtitle: Text('Date: ${data['formattedDateTime']}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportDetailScreen(
                                  reportId: report.id,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        setState(() {
          searchQuery = value.toLowerCase();
        });
      },
      decoration: InputDecoration(
        labelText: 'Search by Patient ID',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.teal,
          ),
          onPressed: () {
            setState(() {
              searchQuery = searchController.text.toLowerCase();
            });
          },
        ),
      ),
    );
  }
}
