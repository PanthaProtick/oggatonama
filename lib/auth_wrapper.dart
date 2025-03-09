import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oggatonama/accounts.dart';
import 'package:oggatonama/dashboard.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          // Ensures that when a user is logged in, they cannot navigate back to login
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offAll(() => Dashboard()); 
          });
          return SizedBox(); // Return an empty widget to prevent flicker
        }
        return Accounts(); // Show login/register screen if no user is found
      },
    );
  }
}
