import 'package:flutter/material.dart';
import 'package:oggatonama/register_page.dart';

import 'login.dart';

class Accounts extends StatelessWidget{
  const Accounts({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF1D1616),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logoWhite.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Text(
                        'Oggatonama !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        ),
                      ),
                      Text(
                        'Uncovering Identities',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Let\'s Get',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                    'Started!',
                    style: TextStyle(
                      color: Color(0xFF7DE38D),
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7DE38D),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Login())
                    );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t Have an Account?',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>RegisterPage())
                    );
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(12, 6, 12, 72),
      //         child: Text(
      //           'Oggatonama',
      //           style: TextStyle(
      //             fontWeight: FontWeight.w800,
      //             fontSize: 56,
      //             color: Color(0xFFD84045)
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      //         child: ElevatedButton.icon(
      //           onPressed: (){
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context)=>Login())
      //             );
      //           },
      //           style: ElevatedButton.styleFrom(
      //               minimumSize: Size(double.infinity,75),
      //               foregroundColor: Color(0xFF8E1616),
      //               backgroundColor: Color(0xFFEEEEEE),
      //           ),
      //           label: Text(
      //             'Login',
      //             style: TextStyle(
      //               fontWeight: FontWeight.w800,
      //               fontSize: 22,
      //             ),
      //           ),
      //           icon: Icon(Icons.login,color: Color(0xFFD84040)),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      //         child: ElevatedButton.icon(
      //             onPressed: (){
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context)=>RegisterPage())
      //               );
      //             },
      //             style: ElevatedButton.styleFrom(
      //                 minimumSize: Size(double.infinity,75),
      //                 backgroundColor: Color(0xFF8E1616),
      //                 foregroundColor: Color(0xFFEEEEEE)
      //             ),
      //             label: Text(
      //               'Register',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.w800,
      //                 fontSize: 22,
      //               ),
      //             ),
      //             icon: Icon(Icons.app_registration,color: Color(0xFFEEEEEE)),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}