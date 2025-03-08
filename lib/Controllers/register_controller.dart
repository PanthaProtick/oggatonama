import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nidController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<void> register(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      print('Empty!');
      return;
    }

    isLoading.value = true;

    try {
      // First create the user account
      await createUserWithEmailAndPassword();

      // Then create the database entry
      await createDBEntry();

      // Clear fields after successful registration
      clearFields();

      // Show success message
      Get.snackbar(
          "Success",
          "Registration completed successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2)
      );

      // Delay slightly for the snackbar to be visible
      await Future.delayed(Duration(milliseconds: 300));

      // Navigate back to the Accounts page
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      } else {
        // Fallback if Navigator stack doesn't have the expected structure
        Get.back();
      }
    } catch (e) {
      print("Registration error: $e");
      // Show error to user
      Get.snackbar(
          "Registration Failed",
          "Please check your information and try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createDBEntry() async {
    try {
      await FirebaseFirestore.instance.collection("users").add({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'nid': nidController.text.trim(),
        'phone': phoneController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Database error: $e");
      throw e; // Re-throw to handle in the register method
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    } catch (e) {
      print("Auth error: $e");
      throw e; // Re-throw to handle in the register method
    }
  }

  void clearFields() {
    firstNameController.clear();
    lastNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nidController.clear();
    phoneController.clear();
    emailController.clear();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nidController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    clearFields();
    super.onInit();
  }
}