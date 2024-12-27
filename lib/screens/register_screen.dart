import 'package:autism/constants.dart';
import 'package:autism/screens/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signin_controller.dart';
import '../widgets/my_text_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Flexible(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Register",
                              style: kHeadline,
                            ),
                            const Text(
                              "Create new account to get started.",
                              style: kBodyText2,
                            ),
                            const SizedBox(height: 50),
                            TextFormField(
                              decoration: InputDecoration(
                                label: const Text('Name', style: kBodyText),
                                prefix: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              controller: controller.name,
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
                              controller: controller.email,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: passwordVisibility,
                              decoration: InputDecoration(
                                label: const Text('Password', style: kBodyText),
                                prefix: const Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisibility = !passwordVisibility;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              controller: controller.password,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: kBodyText.copyWith(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyTextButton(
                      buttonName: 'Register',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim(),
                          );
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
