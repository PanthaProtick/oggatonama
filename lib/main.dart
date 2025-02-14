import 'package:flutter/material.dart';
import 'package:oggatonama/accounts.dart';

void main() {
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