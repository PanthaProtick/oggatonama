import 'package:flutter/material.dart';

class Register extends StatelessWidget{
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final OutlineInputBorder border=OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Colors.white60,
      ),
      borderRadius: BorderRadius.circular(16),
    );


    return Scaffold(
        backgroundColor: Color(0xFF1D1616),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 36,
                      color: Color(0xFFD84040)
                  ),
                ),
              ),
              Column(
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,4,8,4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter first name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xFFEEEEEE)
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: border,
                                enabledBorder: border,
                                hintText: 'First Name',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
              Column(
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,4,8,4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter last name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFEEEEEE)
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: border,
                                enabledBorder: border,
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
              Column(
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,4,8,4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFEEEEEE)
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: border,
                                enabledBorder: border,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
              Column(
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,4,8,4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Re-enter password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFEEEEEE)
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: border,
                                enabledBorder: border,
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
              Column(
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,4,8,4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter NID card number',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFEEEEEE)
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: border,
                                enabledBorder: border,
                                hintText: 'NID Number',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
              Column(
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,4,8,4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter phone number',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFEEEEEE)
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: border,
                                enabledBorder: border,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
              Column(
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,4,8,4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter email address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFEEEEEE)
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: border,
                                enabledBorder: border,
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.pop(context);
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
        )
    );
  }

}