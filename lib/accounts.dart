import 'package:flutter/material.dart';
import 'package:oggatonama/register_page.dart';

import 'login.dart';

class Accounts extends StatelessWidget{
  const Accounts({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF1D1616),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 72),
              child: Text(
                'Oggatonama',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 56,
                  color: Color(0xFFD84045)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Login())
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity,75),
                    foregroundColor: Color(0xFF8E1616),
                    backgroundColor: Color(0xFFEEEEEE),
                ),
                label: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                icon: Icon(Icons.login,color: Color(0xFFD84040)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>RegisterPage())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,75),
                      backgroundColor: Color(0xFF8E1616),
                      foregroundColor: Color(0xFFEEEEEE)
                  ),
                  label: Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                  icon: Icon(Icons.app_registration,color: Color(0xFFEEEEEE)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}