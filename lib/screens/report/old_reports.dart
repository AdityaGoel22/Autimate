import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Color primaryColor = Colors.teal;
Color accentColor = Colors.greenAccent.shade100;
Color backgroundColor = Colors.grey.shade200;
TextStyle labelTextStyle = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);

class CreateOldReport extends StatefulWidget {
  const CreateOldReport({super.key});

  @override
  _CreateOldReportState createState() => _CreateOldReportState();
}

class _CreateOldReportState extends State<CreateOldReport> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController inclenResultController = TextEditingController();
  final TextEditingController isaaResultController = TextEditingController();
  final TextEditingController observationController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  Future<void> saveReport(BuildContext context) async {
    try {
      final CollectionReference reportsCollection =
          FirebaseFirestore.instance.collection('reports');

      final Map<String, dynamic> reportData = {
        'patientId': patientIdController.text.trim(),
        'patientName': patientNameController.text.trim(),
        'age': ageController.text.trim(),
        'sex': sexController.text.trim(),
        'inclenResult': inclenResultController.text.trim(),
        'isaaResult': isaaResultController.text.trim(),
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

  Future<void> _pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: primaryColor),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white,
                onSurface: primaryColor,
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        final formattedDateTime =
            DateFormat('yyyy-MM-dd HH:mm').format(DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        ));
        dateTimeController.text = formattedDateTime;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                    _buildTextField('Test Taken', inclenResultController,
                        'Name of the test'),
                    _buildTextField(
                        'Test Result', isaaResultController, 'Result details'),
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
                      decoration: InputDecoration(
                        labelText: 'Date and Time',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon:
                            Icon(Icons.calendar_today, color: primaryColor),
                      ),
                      onTap: _pickDateTime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select date and time';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            await saveReport(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Please complete all required fields')),
            );
          }
        },
        icon: const Icon(Icons.save, color: Colors.white),
        label: const Text(
          'Save Report',
          style: TextStyle(color: Colors.white),
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
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: labelTextStyle,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
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
}
