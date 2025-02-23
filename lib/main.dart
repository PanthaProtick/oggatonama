import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oggatonama/accounts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Oggatonama());
}

class Oggatonama extends StatelessWidget {
  const Oggatonama({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Accounts(),
      );
  }
}