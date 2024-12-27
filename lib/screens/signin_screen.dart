import 'package:autism/constants.dart';
import 'package:autism/repository/authentication_repository/authentication_repository.dart';
import 'package:autism/screens/home_screen.dart';
import 'package:autism/screens/register_screen.dart';
import 'package:autism/screens/welcome_screen.dart';
import 'package:autism/special_pals/intro.dart';
import 'package:autism/widgets/my_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  String selectedRole = "Doctor"; // Default selected role
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authRepo = AuthenticationRepository.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => const WelcomePage()));
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome back.",
                              style: kHeadline,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "You've been missed!",
                              style: kBodyText2,
                            ),
                            const SizedBox(height: 60),
                            DropdownButtonFormField<String>(
                              value: selectedRole,
                              items: <String>['Parent', 'Doctor']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedRole = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                label:
                                    const Text('Select Role', style: kBodyText),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              iconEnabledColor: Colors.teal,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                label: const Text('Email', style: kBodyText),
                                prefix: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: isPasswordVisible,
                              decoration: InputDecoration(
                                label: const Text('Password', style: kBodyText),
                                prefix: const Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: kBodyText.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyTextButton(
                      buttonName: 'Sign In',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          // Show loading indicator
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                          try {
                            // Attempt to sign in
                            await authRepo.signIn(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );

                            // Navigate based on the selected role if login is successful
                            if (selectedRole == 'Parent') {
                              Get.off(() => IntroPage());
                            } else if (selectedRole == 'Doctor') {
                              Get.off(() => const HomeScreen());
                            } else {
                              Get.off(() => const SignInPage());
                            }
                          } on FirebaseAuthException catch (e) {
                            // Show error message for invalid credentials
                            Get.snackbar(
                              "Login Failed",
                              e.message ?? "Invalid credentials.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } catch (_) {
                            // Show a generic error message for unknown errors
                            Get.snackbar(
                              "Login Failed",
                              "An unknown error occurred.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } finally {
                            // Remove loading indicator
                            if (Get.isDialogOpen == true) {
                              Get.off(() => const HomeScreen());
                            }
                          }
                        }
                      },
                      bgColor: Colors.teal,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
