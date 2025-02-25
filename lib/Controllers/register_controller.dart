import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oggatonama/accounts.dart';

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
    createDBEntry();
    createUserWithEmailAndPassword();
    Navigator.pop(context);
  }

  Future<void> createDBEntry() async{
    try {
      final data = await FirebaseFirestore.instance.collection("users").add({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'nid': nidController.text.trim(),
        'phone': phoneController.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> createUserWithEmailAndPassword() async{
    try {
      final userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
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
}