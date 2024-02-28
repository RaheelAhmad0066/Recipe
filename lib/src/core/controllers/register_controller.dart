import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  // Show or hide password
  var showPassword = true.obs;
  void visiblePassword() => showPassword.value = !showPassword.value;

  @override
  void onInit() {
    passwordListener();
    super.onInit();
  }

  // Password Contains
  var eightChars = false.obs;
  var hasNumber = false.obs;
  var hasSpecialCharacters = false.obs;
  var btnDisable = true.obs;
  void passwordListener() {
    password.addListener(() {
      // Must 8 digit
      if (password.text.length >= 8) {
        eightChars.value = true;
      } else {
        eightChars.value = false;
      }

      // Must container number
      if (password.text.contains(RegExp(r'[0-9]'))) {
        hasNumber.value = true;
      } else {
        hasNumber.value = false;
      }

      // Must container special character
      if (password.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters.value = true;
      } else {
        hasSpecialCharacters.value = false;
      }

      // Diable button
      if (eightChars.value && hasNumber.value && hasSpecialCharacters.value) {
        btnDisable.value = false;
      } else {
        btnDisable.value = true;
      }
    });
  }

  Future<void> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      isLoading(true);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Navigate to the home page after successful sign up
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

      Get.snackbar('SignUp', 'successful register', colorText: Colors.black);
    } catch (e) {
      // Handle sign up errors
      Get.snackbar('SignUp', e.toString(), colorText: Colors.black);

      print("Error signing up: $e");
    } finally {
      isLoading(false);
    }
  }
}
