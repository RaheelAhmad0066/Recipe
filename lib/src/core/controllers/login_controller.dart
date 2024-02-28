import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  var isloading = false.obs;
  // Show or hide password
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var showPassword = true.obs;
  void visiblePassword() => showPassword.value = !showPassword.value;

  Future<void> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      isLoading(true);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Navigate to the home page after successful login
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      Get.snackbar('Login', 'successful login', colorText: Colors.black);
    } catch (e) {
      // Handle login errors
      print("Error signing in: $e");
      Get.snackbar('Login', e.toString(), colorText: Colors.black);
    } finally {
      isLoading(false);
    }
  }

  signInWithGoogle(BuildContext context) async {
    try {
      isloading(true);
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        Get.snackbar('Google', 'successful Google signin',
            colorText: Colors.black);
        return user;
      }
    } catch (error) {
      Get.snackbar('Google', 'Network Error', colorText: Colors.black);

      print(error);
    } finally {
      isloading(false);
    }
    return null;
  }
}
