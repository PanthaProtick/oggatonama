// login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oggatonama/dashboard.dart'; // Import your dashboard page

class LoginController extends GetxController {
  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
          email: emailOrPhoneController.text.trim(),
          password: passwordController.text.trim());

      isLoading.value = false;
      Get.snackbar('Success', 'Login successful');

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard())); // Navigate to Dashboard

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Login failed: ${e.message}');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'An unexpected error occurred: $e');
    }
  }

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}