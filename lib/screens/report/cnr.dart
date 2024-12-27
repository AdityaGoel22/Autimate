import 'package:autism/widgets/my_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Color primaryColor = Colors.teal;
Color accentColor = Colors.greenAccent.shade100;
Color backgroundColor = Colors.grey.shade200;
TextStyle labelTextStyle = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);

class CreateNewReport extends StatelessWidget {
  final String inclenResult;
  final String isaaResult;

  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController observationController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  CreateNewReport(
      {super.key, required this.inclenResult, required this.isaaResult}) {
    final now = DateTime.now();
    final formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(now);
    dateTimeController.text = formattedDateTime;
  }

  Future<void> saveReport(BuildContext context) async {
    try {
      final CollectionReference reportsCollection =
          FirebaseFirestore.instance.collection('reports');

      final Map<String, dynamic> reportData = {
        'patientId': patientIdController.text.trim(),
        'patientName': patientNameController.text.trim(),
        'age': ageController.text.trim(),
        'sex': sexController.text.trim(),
        'inclenResult': inclenResult,
        'isaaResult': isaaResult,
        'observation': observationController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
        'formattedDateTime': dateTimeController.text.trim(),
        'userId': FirebaseAuth.instance.currentUser?.uid, // Add userId here
      };

      await reportsCollection.add(reportData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Report saved successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save report: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inclenResultController = TextEditingController(text: inclenResult);
    final isaaResultController = TextEditingController(text: isaaResult);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Create New Report',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionCard(
                'Patient Information',
                [
                  _buildTextField(
                      'Patient ID', patientIdController, 'e.g., P12345'),
                  _buildTextField(
                      'Patient Name', patientNameController, 'Full name'),
                  _buildTextField('Age', ageController, 'Age in years',
                      keyboardType: TextInputType.number),
                  _buildTextField('Sex', sexController, 'Gender (M/F)'),
                ],
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                'Test Details',
                [
                  TextFormField(
                    controller: inclenResultController,
                    readOnly: true,
                    decoration: _inputDecoration('Test Taken'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: isaaResultController,
                    readOnly: true,
                    decoration: _inputDecoration('Test Result'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                'Observation',
                [
                  _buildTextField('Doctor\'s Observation',
                      observationController, 'Detailed observations',
                      maxLines: 5),
                ],
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                'Date and Time',
                [
                  TextFormField(
                    controller: dateTimeController,
                    readOnly: true,
                    decoration: _inputDecoration('Date and Time').copyWith(
                      suffixIcon:
                          Icon(Icons.calendar_today, color: primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              MyTextButton(
                buttonName: 'Save Report',
                onTap: () async {
                  if (patientIdController.text.isEmpty ||
                      patientNameController.text.isEmpty ||
                      ageController.text.isEmpty ||
                      sexController.text.isEmpty ||
                      observationController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All fields are required')),
                    );
                  } else {
                    await saveReport(context);
                  }
                },
                bgColor: primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, String hint,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: _inputDecoration(label, hint: hint),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: labelTextStyle.copyWith(color: primaryColor, fontSize: 18),
            ),
            const SizedBox(height: 10),
            ...children.map((child) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: child,
                )),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, {String hint = ''}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: labelTextStyle,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
