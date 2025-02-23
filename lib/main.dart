import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oggatonama/accounts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCkEo-EvfkhBgo_EjD0SufA5RlmbETx08Q",
            authDomain: "oggatonama-591021.firebaseapp.com",
            projectId: "oggatonama-591021",
            storageBucket: "oggatonama-591021.firebasestorage.app",
            messagingSenderId: "133326199109",
            appId: "1:133326199109:web:b7bc10c687805a4768c62c",
            measurementId: "G-WT51JJ3T95"
        )
    );
  }
  else{
    await Firebase.initializeApp();
  }


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