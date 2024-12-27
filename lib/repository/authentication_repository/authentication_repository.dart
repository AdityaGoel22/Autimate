import 'package:autism/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:autism/screens/home_screen.dart';
import 'package:autism/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../screens/signin_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onReady() {
    super.onReady();
    _auth.setLanguageCode('en'); // Set the locale here if needed
    firebaseUser.value = _auth.currentUser;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SignInPage())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.offAll(() => const SignInPage());
    } on FirebaseAuthException catch (e) {
      final exception = SignupWithEmailPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${exception.message}");
      Get.snackbar("Signup Failed", exception.message);
    } catch (_) {
      const exception = SignupWithEmailPasswordFailure();
      print("FIREBASE AUTH EXCEPTION - ${exception.message}");
      Get.snackbar("Signup Failed", exception.message);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      // Attempt to sign in with Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if a user is actually signed in
      if (userCredential.user == null) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'Invalid email or password.',
        );
      }
    } on FirebaseAuthException catch (e) {
      // Re-throw the exception for the caller to handle
      throw e;
    } catch (_) {
      // Catch all other errors
      throw Exception('An unknown error occurred.');
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const WelcomePage());
    } on FirebaseAuthException catch (e) {
      print("FIREBASE AUTH EXCEPTION - ${e.message}");
      Get.snackbar("Logout Failed", e.message ?? "An unknown error occurred.");
    } catch (_) {
      print("AN UNKNOWN ERROR OCCURRED");
      Get.snackbar("Logout Failed", "An unknown error occurred.");
    }
  }
}
