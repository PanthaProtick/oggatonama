import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oggatonama/accounts.dart';
import 'package:oggatonama/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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